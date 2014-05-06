class AddAttributesToPerson < ActiveRecord::Migration
  def change
  	add_column :people, :gender, :string
  	add_column :people, :married, :boolean
  	add_column :people, :childrens, :integer
  	add_column :people, :car, :boolean
  	add_column :people, :current_live, :string
  end
end
