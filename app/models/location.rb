class Location < ActiveRecord::Base
  generate_fixtures

  belongs_to :neighborhood
  has_one :expansion, through: :neighborhood
  belongs_to :encounter_type_1, class_name: 'EncounterType'
  belongs_to :encounter_type_2, class_name: 'EncounterType'
  attr_accessible :name, :stable, :neighborhood_id, :encounter_type_1_id, :encounter_type_2_id

  def encounter_types
    [encounter_type_1, encounter_type_2].compact
  end
end
