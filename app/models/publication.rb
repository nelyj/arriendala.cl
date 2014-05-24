class Publication < ActiveRecord::Base
  attr_accessible :description, :title,
  :address, :latitude, :longitude

  geocoded_by :address
  after_validation :geocode
  
  belongs_to :user
end
