class AddDepthToCells < ActiveRecord::Migration
  def change
    add_column :cells, :depth, :integer
  end
end
