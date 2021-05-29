FactoryBot.define do
  factory :purchase_buyer do
    postal_code       { "111-1111" }
    prefecture_id     { 2 }
    city              { "テストシティ" }
    address           { "テストアドレス" }
    building_number   { "テストビル" }
    phone_number      { "01011112222" }
    token             { "tok_0000000000000000" }
  end
end