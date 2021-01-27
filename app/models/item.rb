class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :title, :text, presence: true
  validates :category_id, numericality: { other_than: 1 }
  belongs_to :status
  validates :title, :text, presence: true
  validates :status_id, numericality: { other_than: 1 }
  belongs_to :shipping_fee_burden
  validates :title, :text, presence: true
  validates :shipping_fee_burden_id, numericality: { other_than: 1 }
  belongs_to :prefecture
  validates :title, :text, presence: true
  validates :prefecture_id, numericality: { other_than: 1 }
  belongs_to :days_to_ship
  validates :title, :text, presence: true
  validates :days_to_ship_id, numericality: { other_than: 1 }
  belongs_to :user
  has_one :buy_record
  has_one_attached :image
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :shipping_fee_burden_id, presence: true
  validates :prefecture_id, presence: true
  validates :days_to_ship_id, presence: true
  validates :price, presence: true
  validates :image, presence: true
end
