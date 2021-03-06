class Neighborhood < ActiveRecord::Base
  generate_fixtures

  attr_accessible :expansion, :expansion_id, :name
  belongs_to :expansion

  scope :with_associations, include: [:expansion]
end
