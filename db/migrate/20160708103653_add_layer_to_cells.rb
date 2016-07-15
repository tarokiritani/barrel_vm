class AddLayerToCells < ActiveRecord::Migration
  def change
    add_column :cells, :layer, :string
  end
end
