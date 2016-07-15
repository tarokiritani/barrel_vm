class AddChannelToCells < ActiveRecord::Migration
  def change
    add_column :cells, :channel, :integer
  end
end
