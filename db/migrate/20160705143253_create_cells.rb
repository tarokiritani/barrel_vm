class CreateCells < ActiveRecord::Migration
  def change
    create_table :cells do |t|
      t.string :cell_type

      t.timestamps
    end
  end
end
