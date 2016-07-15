class AddPipetteResistanceToCells < ActiveRecord::Migration
  def change
    add_column :cells, :pipette_resistance, :decimal
  end
end
