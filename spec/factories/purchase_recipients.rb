FactoryBot.define do
  factory :purchase_recipient do
    postal_code             { "123-4567" }
    prefecture_id           { Faker::Number.between(from: 2, to: 48) }
    city                    { Gimei.address.city.kanji }
    address                 { Faker::Lorem.sentence }
    buillding               { Faker::Lorem.sentence }
    phone_number            { Faker::Number.between(from: 1, to: 99999999999) }
    token                   {"tok_abcdefghijk00000000000000000"}
    price                   {}
    user_id                 {}
    item_id                 {}
  end
end
