FactoryBot.define do
  factory :order_address do
    
    test_address = Gimei.address

    post_code     {Faker::Number.number(digits: 7).to_s.insert(3, "-")}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    cities        {test_address.city.kanji}
    address       {test_address.town.kanji}
    building      {Faker::Lorem.word}
    tel_number    {Faker::Number.number(digits: 10).to_s}
    token {'tok_' + Faker::Lorem.characters(number: 28)}


  end
end
