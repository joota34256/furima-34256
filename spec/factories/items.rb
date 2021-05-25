FactoryBot.define do
  factory :item do
    name                  { 'test' }
    description           { 'test' }
    shipping_charge_id    { 3 }
    prefecture_id         { 2 }
    shipping_date_id      { 2 }
    price                 { 2000 }
    category_id           { 2 }
    state_id              { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
