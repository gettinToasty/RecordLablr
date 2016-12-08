class Album < ApplicationRecord
  validates :band_id, :title, presence: true
  validates :live, inclusion: { in: ["true", "false"] }

  belongs_to :band

  has_many :tracks,
    dependent: :destroy
end
