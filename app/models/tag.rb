class Tag < ActiveRecord::Base

  has_many :art_tags
  has_many :art_pieces, through: :art_tags

end
