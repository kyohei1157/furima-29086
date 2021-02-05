FactoryBot.define do
  factory :address_form do
    postal_cord {'123-4567'}
    prefecture_id {2}
    municipality {'札幌市'}
    address {'青山1-13-2'}
    buildingname {'123ヒルズ'}
    phone_number {'09012345678'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
