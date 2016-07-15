class AddBrainAreaToCells < ActiveRecord::Migration
  def change
    add_column :cells, :brain_area, :string
  end
end
