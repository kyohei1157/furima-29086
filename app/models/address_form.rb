class AddressForm
  include ActiveModel::Model
  attr_accessor :postal_cord, :prefecture_id, :municipality, :address, :phone_number, :user_id, :item_id, :token, :buildingname
  
  with_options presence: true do
    validates :postal_cord, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id
    validates :municipality
    validates :address
    validates :phone_number
    validates :token
   # validates :card_number, length: { maximum: 16 }, numericality: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
    #validates :month
    #validates :year
    #validates_inclusion_of :security_code, in: 3..4
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_cord: postal_cord, prefecture_id: prefecture_id, municipality: municipality, address: address, buildingname: buildingname, phone_number: phone_number, order_id: order.id)
  end
end
