class CreateExpansions < ActiveRecord::Migration
  def change
    create_table :expansions do |t|
      t.string :name
      t.integer :year
      t.boolean :big_box
    end
  end
end
