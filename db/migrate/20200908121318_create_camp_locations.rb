class CreateCampLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :camp_locations do |t|
      t.string :name

      t.timestamps
    end
    add_index :camp_locations, :name, unique: true
  end
end
