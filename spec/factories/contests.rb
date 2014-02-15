# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contest do
    name { Faker::Name.name}
    active_round 1
    posted false
  end
end
