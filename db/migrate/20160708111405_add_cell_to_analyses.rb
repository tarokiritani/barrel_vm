class AddCellToAnalyses < ActiveRecord::Migration
  def change
    add_reference :analyses, :cell, index: true, foreign_key: true
  end
end
