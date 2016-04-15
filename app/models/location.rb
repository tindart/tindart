class Location < ActiveRecord::Base
    has_many :art_piece
    has_many :tags, through :art_tags
end
