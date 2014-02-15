# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :image do
    flickr_id "12525380134"
    owner "John Doe"
    title "Photo of my dog"
    url { Faker::Internet.url }
  end
end
