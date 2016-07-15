class AddTemparatureToCells < ActiveRecord::Migration
  def change
    add_column :cells, :temparature, :decimal
  end
end
