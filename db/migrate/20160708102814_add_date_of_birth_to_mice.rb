class AddDateOfBirthToMice < ActiveRecord::Migration
  def change
    add_column :mice, :date_of_birth, :datetime
  end
end
