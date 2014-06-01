class AddAttributesExtrasToPerson < ActiveRecord::Migration
  def change
    add_column :people, :address_work, :string
    add_column :people, :longitude_work, :float
    add_column :people, :latitude_work, :float
  end
end
