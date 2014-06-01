class Person < ActiveRecord::Base
  attr_accessible :name, :last_name, :address, :latitude, :longitude,
  :birthday_day, :birthday_month, :birthday_year


  belongs_to :user
end
