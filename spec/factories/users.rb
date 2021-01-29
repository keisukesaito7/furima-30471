FactoryBot.define do
  factory :user do
    nickname { Faker::Name.first_name }
    email { Faker::Internet.free_email }
    password { SecureRandom.hex(3) }
    password_confirmation { password }
    last_name { '姓' }
    first_name { '名' }
    last_name_kana { 'タケダ' }
    first_name_kana { 'シンゲン' }
    birth_date { Faker::Date.between(from: '1930-01-01', to: '2021-03-31') }
  end
end
