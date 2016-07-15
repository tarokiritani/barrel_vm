class AddFileToAnalyses < ActiveRecord::Migration
  def change
    add_column :analyses, :file, :string
  end
end
