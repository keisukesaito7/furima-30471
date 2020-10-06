FactoryBot.define do
  factory :item_order do
    postal_code   {"123-4567"}
    prefecture_id { Faker::Number.within(range: 2..48) }
    city          { Faker::Address.city }
    addresses     { Faker::Address.street_address }
    building      { Faker::Address.building_number }
    phone_number  { Faker::Number.within(range: 1..11) }
    user_id       { Faker::Number.within(range: 1..100) }
    item_id       { Faker::Number.within(range: 1..100) }
    token         { Faker::Lorem.word }
  end
end
