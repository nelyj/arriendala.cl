class Person < ActiveRecord::Base
  attr_accessible :name, :last_name, :address, :latitude, :longitude,
  :address_work, :longitude_work, :latitude_work, :gender, :married, :childrens, :birthday_day, :birthday_month, :birthday_year


  belongs_to :user
end
