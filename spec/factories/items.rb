FactoryBot.define do
  factory :item do
    association :user

    name {'おいうえお'}
    explanation {'かきくけこ'}
    category_id {2}
    status_id{2}
    shipping_fee_burden_id{2}
    prefecture_id{2}
    days_to_ship_id{2}
    price {3000}
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
