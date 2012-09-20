class MythosType < ActiveRecord::Base
  generate_fixtures

  attr_accessible :name

  def environment?
    name =~ /^Environment/
  end

  def rumor?
    name == 'Rumor'
  end

  def headline?
    name == 'Headline'
  end
end
