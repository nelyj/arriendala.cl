class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.text :features
      t.float :price

      t.timestamps
    end
  end
end
