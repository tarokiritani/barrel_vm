class AddCageNumberToMice < ActiveRecord::Migration
  def change
    add_column :mice, :cage_number, :string
  end
end
