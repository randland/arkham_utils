class AddAttachmentIconToExpansions < ActiveRecord::Migration
  def self.up
    change_table :expansions do |t|
      t.has_attached_file :icon
    end
  end

  def self.down
    drop_attached_file :expansions, :icon
  end
end
