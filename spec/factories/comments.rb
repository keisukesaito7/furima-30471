FactoryBot.define do
  factory :comment do
    text { Faker::Lorem.characters(number: 100) }
    association :user
    association :item
  end
end
