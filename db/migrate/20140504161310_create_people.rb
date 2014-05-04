class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :last_name
      t.integer :birthday_day
      t.integer :birthday_month
      t.integer :birthday_year

      t.timestamps
    end
  end
end
