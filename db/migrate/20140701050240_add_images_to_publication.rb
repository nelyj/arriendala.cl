class AddImagesToPublication < ActiveRecord::Migration
  def change
  	add_attachment :publications, :image_one
  end
end
