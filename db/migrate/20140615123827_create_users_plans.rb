class CreateUsersPlans < ActiveRecord::Migration
  def change
    create_table :users_plans do |t|
      t.integer :user_id
      t.integer :plan_id
      t.boolean :activo
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end

    add_index :users_plans, :user_id
    add_index :users_plans, :plan_id
  end
end
