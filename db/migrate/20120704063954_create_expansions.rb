class CreateExpansions < ActiveRecord::Migration
  def change
    create_table :expansions do |t|
      t.string :name
      t.string :year
      t.boolean :big_box

      t.timestamps
    end
  end
end
