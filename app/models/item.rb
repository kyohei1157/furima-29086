class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user
  belongs_to :status
  belongs_to :shipping_fee_burden
  belongs_to :prefecture
  belongs_to :days_to_ship
  #has_one :buy_record
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :explanation, length: { maximum: 1000 }
    validates :category_id
    validates :status_id
    validates :shipping_fee_burden_id
    validates :prefecture_id
    validates :days_to_ship_id
    validates :price, numericality: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
    validates :image
    validates_inclusion_of :price, in: 300..9999999
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_fee_burden_id
    validates :prefecture_id
    validates :days_to_ship_id
  end
end
