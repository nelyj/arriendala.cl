class Person < ActiveRecord::Base
  attr_accessible :birthday_day, :birthday_month, :birthday_year, 
  :last_name, :name, :address, :latitude, :longitude

  geocoded_by :address
  after_validation :geocode
  
  validates :name, presence: true

  belongs_to :user
end
