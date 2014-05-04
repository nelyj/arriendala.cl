class Person < ActiveRecord::Base
  attr_accessible :birthday_day, :birthday_month, :birthday_year, :last_name, :name
  belongs_to :user
end
