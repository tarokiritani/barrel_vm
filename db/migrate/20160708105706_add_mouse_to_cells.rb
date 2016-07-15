class AddMouseToCells < ActiveRecord::Migration
  def change
    add_reference :cells, :mouse, index: true, foreign_key: true
  end
end
