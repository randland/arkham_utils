class AddAttachmentIconToEncounterTypes < ActiveRecord::Migration
  def self.up
    change_table :encounter_types do |t|
      t.has_attached_file :icon
    end
  end

  def self.down
    drop_attached_file :encounter_types, :icon
  end
end
