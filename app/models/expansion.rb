class Expansion < ActiveRecord::Base
  attr_accessible :big_box, :name, :year

  has_attached_file :icon, styles: { thumb: '24x20>' }
end
