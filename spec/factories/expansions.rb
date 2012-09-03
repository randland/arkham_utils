FactoryGirl.define do
  sequence(:name) { |n| "Test Expansion #{n}" }

  factory :expansion do
    name
    year 2000
  end
end
