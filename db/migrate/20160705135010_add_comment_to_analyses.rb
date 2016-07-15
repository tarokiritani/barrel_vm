class AddCommentToAnalyses < ActiveRecord::Migration
  def change
    add_column :analyses, :comment, :string
  end
end
