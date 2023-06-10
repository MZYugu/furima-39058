FactoryBot.define do
  factory :item do
    item_name       {Faker::Lorem.word}
    price           {Faker::Number.between(from: 300, to: 9999999)}
    text            {Faker::Lorem.paragraph}
    category_id     {Faker::Number.between(from: 2, to: 11)}
    item_status_id  {Faker::Number.between(from: 2, to: 7)}
    postage_bare_id {Faker::Number.between(from: 2, to: 3)}
    prefecture_id   {Faker::Number.between(from: 2, to: 48)}
    days_ship_id    {Faker::Number.between(from: 2, to: 4)}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/IMG_4367.JPG'), filename: 'IMG_4367.JPG')
    end
  end
end
