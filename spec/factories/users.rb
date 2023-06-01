FactoryBot.define do
  factory :user do

    test_user = Gimei.name

    nickname              {Faker::Internet.username}
    email                 {Faker::Internet.free_email}
    password              {'a1' + Faker::Internet.password(min_length: 4)}
    password_confirmation {password}
    lastname_kanji        {test_user.last.kanji}
    firstname_kanji       {test_user.first.kanji}
    lastname_katakana     {test_user.last.katakana}
    firstname_katakana    {test_user.first.katakana}
    birthday              {Faker::Date.birthday(min_age: 10, max_age: 100)}
  end
end
