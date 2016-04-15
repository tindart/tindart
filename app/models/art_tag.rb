class ArtTag < ActiveRecord::Base

  belongs_to :tag
  belongs_to :art_piece

end
