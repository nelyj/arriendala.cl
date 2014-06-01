class RemoveAttributesToPerson < ActiveRecord::Migration
  def up
  	remove_column :people, :car
  	remove_column :people, :childrens
  	remove_column :people, :current_live
  	remove_column :people, :address
  	remove_column :people, :longitude
  	remove_column :people, :latitude
  	remove_column :people, :address_work
  	remove_column :people, :longitude_work
  	remove_column :people, :latitude_work
  	add_column :people, :start_address, :string
  	add_column :people, :end_address, :string
  	add_column :people, :start_latitude, :float
  	add_column :people, :start_longitude, :float
  	add_column :people, :end_latitude, :float
  	add_column :people, :end_longitude, :float
  end

  def down
  	add_column :people, :car, :boolean
  	add_column :people, :childrens, :integer
  	add_column :people, :current_live, :string
  	add_column :people, :address, :string
  	add_column :people, :longitude, :float
  	add_column :people, :latitude, :float
  	add_column :people, :address_work, :string
  	add_column :people, :longitude_work, :float
  	add_column :people, :latitude_work, :float
  	remove_column :people, :start_address
  	remove_column :people, :end_address
  	remove_column :people, :start_latitude
  	remove_column :people, :start_longitude
  	remove_column :people, :end_latitude
  	remove_column :people, :end_longitude
  end
end
