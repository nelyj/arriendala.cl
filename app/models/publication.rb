class Publication < ActiveRecord::Base
  attr_accessible :description, :title, :address, :latitude, :longitude

  belongs_to :user
end
