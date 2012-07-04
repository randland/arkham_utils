class Investigator < ActiveRecord::Base
  attr_accessible :expansion, :focus, :name, :occupation, :sanity, :stamina
  belongs_to :expansion
end
