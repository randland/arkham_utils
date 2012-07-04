class CreateInvestigators < ActiveRecord::Migration
  def change
    create_table :investigators do |t|
      t.string :name
      t.string :occupation
      t.integer :sanity
      t.integer :stamina
      t.integer :focus
      t.references :expansion
    end
  end
end
