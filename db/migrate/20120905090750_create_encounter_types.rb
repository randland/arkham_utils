class CreateEncounterTypes < ActiveRecord::Migration
  def change
    create_table :encounter_types do |t|
      t.string :name
    end
  end
end
