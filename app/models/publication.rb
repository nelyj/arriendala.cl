class Publication < ActiveRecord::Base
  attr_accessible :description, :title,
  :address, :latitude, :longitude, :tipo_propiedad, :modalidad, :tipo_arriendo, :amoblado,
  :antiguedad, :banios, :habitaciones, :metros_cuadrados, :precio, :image_one


  has_attached_file :image_one, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image_one, :content_type => /\Aimage\/.*\Z/

  geocoded_by :address
  after_validation :geocode
  
  belongs_to :user
end
