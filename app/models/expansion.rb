class Expansion < ActiveRecord::Base
  attr_accessible :big_box, :name, :year, :icon

  has_attached_file :icon, styles: { thumb: '24x20>' },
    path: 'public/system/:class/:attachment/:style/:filename',
    url: '/system/:class/:attachment/:style/:basename.:extension'

  has_many :investigators

  validates_presence_of :name, :year
  validates_uniqueness_of :name

end
