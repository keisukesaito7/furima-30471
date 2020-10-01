FactoryBot.define do
  factory :user do
    nickname {Faker::Name.first_name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name {"齋藤"}
    first_name {"啓介"}
    last_name_kana {"サイトウ"}
    first_name_kana {"ケイスケ"}
    birth_date {Faker::Date.between(from: "1930-01-01", to: "2021-03-31")}
  end
end
