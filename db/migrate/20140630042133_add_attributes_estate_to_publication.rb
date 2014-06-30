class AddAttributesEstateToPublication < ActiveRecord::Migration
  def change
    add_column :publications, :tipo_propiedad, :string
    add_column :publications, :modalidad, :string
    add_column :publications, :tipo_arriendo, :string
    add_column :publications, :amoblado, :string
    add_column :publications, :antiguedad, :string
    add_column :publications, :banios, :integer
    add_column :publications, :habitaciones, :integer
    add_column :publications, :metros_cuadrados, :integer
    add_column :publications, :precio, :float
  end
end
