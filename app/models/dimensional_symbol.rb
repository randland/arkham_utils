class DimensionalSymbol < ActiveRecord::Base
  generate_fixtures

  attr_accessible :name, :icon

  has_attached_file :icon, styles: { thumb: '14x12>' },
    path: 'public/system/:class/:attachment/:style/:filename',
    url: '/system/:class/:attachment/:style/:basename.:extension'

end
