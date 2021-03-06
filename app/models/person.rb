class Person < ActiveRecord::Base
  attr_accessible :name, :last_name, :gender, :married,:birthday_day, :birthday_month, :birthday_year,
  :start_address, :start_latitude, :start_longitude,
  :end_address, :end_latitude, :end_longitude,:created_at, :id, :updated_at, :user_id, :image_url,:relationship_status

  geocoded_by :start_address, latitude: :start_latitude, longitude: :start_longitude
	geocoded_by :end_address, latitude: :end_latitude, longitude: :end_longitude

	before_save :geo_by_start_address
	before_save :geo_by_end_address

  belongs_to :user

  private

  def geo_by_start_address
  	coords = Geocoder.coordinates(self.start_address)
    if coords.nil?
      self.start_latitude = nil
      self.start_longitude = nil
    else
     self.start_latitude = coords[0]
  	 self.start_longitude = coords[1]
    end
  end

  def geo_by_end_address
  	coords = Geocoder.coordinates(self.end_address)
    if coords.nil?
      self.end_latitude = nil
      self.end_longitude = nil
    else
     self.end_latitude = coords[0]
     self.end_longitude = coords[1]
    end
  end
end
