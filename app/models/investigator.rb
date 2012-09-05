class Investigator < ActiveRecord::Base
  generate_fixtures

  attr_accessible :expansion, :focus, :name, :occupation, :sanity, :stamina, :expansion_id
  belongs_to :expansion

end
