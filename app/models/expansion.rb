class Expansion < ActiveRecord::Base
  generate_fixtures

  attr_accessible :big_box, :name, :year, :icon

  has_attached_file :icon, styles: { thumb: '24x20>' },
    path: 'public/system/:class/:attachment/:style/:filename',
    url: '/system/:class/:attachment/:style/:basename.:extension'

  has_many :investigators
  has_many :neighborhoods

  validates_presence_of :name, :year
  validates_uniqueness_of :name
end
