FactoryBot.define do
  factory :user do
    nickname              {Faker::Internet.username}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    lastname_kanji
    firstname_kanji
    lastname_katakana
    firstname_katakana
    birthday              {Faker::Date.birthday(min_age: 10, max_age: 100)}
  end
end
