class Track < ApplicationRecord
  validates :title, :album_id, :lyrics, presence: true
  validates :bonus, inclusion: { in: ["true", "false"] }


  belongs_to :album

  has_one :band,
    through: :album,
    source: :band
end
