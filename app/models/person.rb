class Person < ActiveRecord::Base
  attr_accessible :birthday_day, :birthday_month, :birthday_year, 
  :last_name, :name, :address, :latitude, :longitude


  belongs_to :user
end
