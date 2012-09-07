# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    name "MyString"
    neighborhood nil
    stable false
    expansion nil
  end
end
