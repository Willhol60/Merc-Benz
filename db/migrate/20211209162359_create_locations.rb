class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    change_table :locations do |t|
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
