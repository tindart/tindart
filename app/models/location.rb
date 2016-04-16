class Location < ActiveRecord::Base

  has_many :location_tags
  has_many :tags, through: :location_tags

end
