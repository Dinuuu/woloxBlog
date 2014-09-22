FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.characters(6) }
    text { Faker::Lorem.paragraph }
  end
end