FactoryBot.define do
  factory :order do
    postal_cord {123-4567}
    prefecture_id {2}
    municipality {'札幌市'}
    address {'青山1-13-2'}
    phone_number {'09012345678'}
    card_number {1122334455667788}
    month {3}
    year {23}
    security_code {123}
  end
end
