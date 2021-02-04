class AddressForm
  include ActiveModel::Model
  attr_accessor :postal_cord, :prefecture_id, :municipality, :address, :phone_number, :user_id, :item_id, :token
  
  with_options presence: true do
    validates :postal_cord
    validates :prefecture_id
    validates :municipality
    validates :address
    validates :phone_number
   # validates :card_number, length: { maximum: 16 }, numericality: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
    #validates :month
    #validates :year
    #validates_inclusion_of :security_code, in: 3..4
  end

  def save
    Address.create(postal_code: postal_code, prefecture_id: prefectureid, municipality: municipality, address: address, building_name: building_name, user_id: user.id)
    Donation.create(user_id: user.id, item_id: item.id)
  end
end
