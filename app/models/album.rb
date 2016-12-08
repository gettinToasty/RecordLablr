class Album < ApplicationRecord
  validates :band_id, :title, :live, presence: true

  belongs_to :band

  has_many :tracks,
    dependent: :destroy
end
