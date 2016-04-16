class LocationTag < ActiveRecord::Base

  belongs_to :tag
  belongs_to :location

end
