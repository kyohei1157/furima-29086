class Item < ApplicationRecord
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :explanation
    validates :category_id
    validates :status_id
    validates :shipping_fee_burden_id
    validates :prefecture_id
    validates :days_to_ship_id
    validates :price
    validates :user
    validates :image, presence: true
  end

end
