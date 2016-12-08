class ActivationMailer < ApplicationMailer
  default from: 'admin@recordlablr.com'

  def activation_email(user)
    @user = user
    @url  = "localhost:3000/users/activate?activation_token=#{@user.activation_token}"
    mail(to: user.email, subject: 'Activate your RecordLablr Account')
  end

end
