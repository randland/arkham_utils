class AddAttachmentIconToDimensionalSymbols < ActiveRecord::Migration
  def self.up
    change_table :dimensional_symbols do |t|
      t.has_attached_file :icon
    end
  end

  def self.down
    drop_attached_file :dimensional_symbols, :icon
  end
end
