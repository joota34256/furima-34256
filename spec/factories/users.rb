FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number:2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length:6)}
    password_confirmation {password}
    first_name_kanji      {'仮名'}
    last_name_kanji       {'仮姓'}
    first_name_kana       {'カリナ'}
    last_name_kana        {'カリセイ'}
    birthday              {'20000101'}

  end
end
