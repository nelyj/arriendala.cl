class Publication < ActiveRecord::Base
  attr_accessible :description, :title,
  :address, :latitude, :longitude, :tipo_propiedad, :modalidad, :tipo_arriendo, :amoblado,
  :antiguedad, :banios, :habitaciones, :metros_cuadrados, :precio

  geocoded_by :address
  after_validation :geocode
  
  belongs_to :user
end
