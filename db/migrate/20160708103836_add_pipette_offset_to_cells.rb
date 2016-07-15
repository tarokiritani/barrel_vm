class AddPipetteOffsetToCells < ActiveRecord::Migration
  def change
    add_column :cells, :pipette_offset, :decimal
  end
end
