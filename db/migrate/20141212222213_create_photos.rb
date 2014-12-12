class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|

      t.timestamps
    end

    add_attachment :photos, :asset
    add_column :photos, :publication_id, :integer
    add_index :photos, :publication_id
  end
end
