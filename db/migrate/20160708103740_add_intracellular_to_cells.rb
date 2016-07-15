class AddIntracellularToCells < ActiveRecord::Migration
  def change
    add_column :cells, :intracellular, :string
  end
end
