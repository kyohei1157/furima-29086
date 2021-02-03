class Order < ApplicationRecord
  attr_accessor :token
  
  validates :price, presence: true
  validates :token, presence: true
  validates :postal_cord, presence: true
  validates :prefecture_id, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :card_number, presence: true
  validates :month, presence: true
  validates :year, presence: true
  validates :security_code, presence: true
end
