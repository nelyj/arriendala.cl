class Publication < ActiveRecord::Base
  attr_accessible :description, :title,
  :address, :latitude, :longitude, :tipo_propiedad, :modalidad, :tipo_arriendo, :amoblado,
  :antiguedad, :banios, :habitaciones, :metros_cuadrados, :precio, :image_one


  has_attached_file :image_one, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


  geocoded_by :address
  after_validation :geocode
  
  belongs_to :user
end
