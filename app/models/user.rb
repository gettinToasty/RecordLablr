class User < ApplicationRecord

  validates :username,
            :email,
            :password_digest,
            :session_token,
            presence: true

  validates :username, :email, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  has_many :notes

  after_initialize :ensure_session_token

  attr_reader :password

  def self.find_by_credentials(email, pw)
    user = User.find_by(email: email)
    return user if user && user.is_password?(pw)
    nil
  end

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  def is_password?(pw)
    pw_obj = BCrypt::Password.new(password_digest)
    pw_obj.is_password?(pw)
  end

  def generate_session_token
    SecureRandom.urlsafe_base64(128)
  end

  def ensure_session_token
    self.session_token ||= generate_session_token
  end

  def reset_session_token!
    self.session_token = generate_session_token
    self.save
  end

end
