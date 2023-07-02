FactoryBot.define do
  factory :address do

    test_address = Gimei.address

    post_code     {Faker::Number.number(digits: 7).to_s.insert(3, "-")}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    cities        {test_address.city.kanji}
    address       {test_address.town.kanji}
    building      {Faker::Lorem.word}
    tel_number    {'0' + Faker::Number.number(digits: 9).to_s}
    association :order
    
  end
end
