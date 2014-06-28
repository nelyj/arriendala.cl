class AddRelationshipStatusToPerson < ActiveRecord::Migration
  def change
    add_column :people, :relationship_status, :string
  end
end
