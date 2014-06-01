class Person < ActiveRecord::Base
  attr_accessible :name, :last_name, :address, :latitude, :longitude,
  :address_work, :longitude_work, :latitude_work, :gender, :married, :childrens, :birthday_day, :birthday_month, :birthday_year

  #to live
  geocoded_by :address
 	#to work
  geocoded_by :address_work, :latitude => :latitude_work, :longitude => :longitude_work

  belongs_to :user
end
