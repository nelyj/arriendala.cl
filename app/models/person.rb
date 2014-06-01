class Person < ActiveRecord::Base
  attr_accessible :name, :last_name, :address, :latitude, :longitude,
  :address_work, :longitude_work, :latitude_work, :gender, :married, :childrens, :birthday_day, :birthday_month, :birthday_year, :current_live

  
 	geocoded_by :address_work, latitude: :latitude_work, longitude: :longitude_work 
 	geocoded_by :address, latitude: :latitude, longitude: :longitude
  

  belongs_to :user
end
