class EncounterType < ActiveRecord::Base
  generate_fixtures

  attr_accessible :name, :icon

  has_attached_file :icon, styles: { thumb: '24x20>' },
    path: 'public/system/:class/:attachment/:style/:filename',
    url: '/system/:class/:attachment/:style/:basename.:extension'

end
