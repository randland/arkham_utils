class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.references :neighborhood
      t.references :encounter_type_1
      t.references :encounter_type_2
      t.boolean :stable
    end
    add_index :locations, :neighborhood_id
  end
end
