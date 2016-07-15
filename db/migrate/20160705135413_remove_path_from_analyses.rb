class RemovePathFromAnalyses < ActiveRecord::Migration
  def up
    remove_column :analyses, :path
  end

  def down
    add_column :analyses, :path, :string
  end
end
