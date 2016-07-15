class AddSpeciesStrainToMice < ActiveRecord::Migration
  def change
    add_column :mice, :species_strain, :string
  end
end
