class Person < ActiveRecord::Base
  attr_accessible :name, :last_name, :address, :latitude, :longitude,
  :address_work, :longitude_work, :latitude_work, :gender, :married, :childrens, :birthday_day, :birthday_month, :birthday_year

  geocoded_by :address  #to live
 	geocoded_by :address_work, :latitude => :latitude_work, :longitude => :longitude_work #to work

  after_validation :geocode

  belongs_to :user
end
