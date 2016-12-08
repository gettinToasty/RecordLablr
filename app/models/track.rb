class Track < ApplicationRecord
  validates :title, :album_id, :bonus, :lyrics, presence: true


  belongs_to :album

  has_one :band,
    through: :album,
    source: :band
end
