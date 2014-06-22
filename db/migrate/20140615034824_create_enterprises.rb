class CreateEnterprises < ActiveRecord::Migration
  def change
    create_table :enterprises do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.text :description

      t.timestamps
    end

    add_column :enterprises, :user_id, :integer
    add_index :enterprises, :user_id
  end
end
