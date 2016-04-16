class ArtPiece < ActiveRecord::Base

  has_many :art_tags
  has_many :tags, through: :art_tags

  has_many :events

end
