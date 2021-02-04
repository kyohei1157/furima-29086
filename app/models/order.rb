class Order < ApplicationRecord
  attr_accessor :token
  with_options presence: true do
    validates :postal_cord
    validates :prefecture_id
    validates :municipality
    validates :address
    validates :phone_number, length: { maximum: 11 }
    validates :card_number, length: { maximum: 16 }, numericality: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
    validates :month
    validates :year
    validates_inclusion_of :security_code, in: 3..4
  end
end
