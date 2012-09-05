class Neighborhood < ActiveRecord::Base
  generate_fixtures

  attr_accessible :expansion, :name
end
