class CreateMythosTypes < ActiveRecord::Migration
  def change
    create_table :mythos_types do |t|
      t.string :name
    end
  end
end
