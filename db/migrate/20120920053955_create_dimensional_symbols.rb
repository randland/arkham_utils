class CreateDimensionalSymbols < ActiveRecord::Migration
  def change
    create_table :dimensional_symbols do |t|
      t.string :name
    end
  end
end
