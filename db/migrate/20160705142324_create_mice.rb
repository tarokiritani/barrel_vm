class CreateMice < ActiveRecord::Migration
  def change
    create_table :mice do |t|
      t.string :sex

      t.timestamps
    end
  end
end
