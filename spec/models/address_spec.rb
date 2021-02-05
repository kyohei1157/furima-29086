require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end
  describe '商品購入' do
    it "郵便番号がなければ登録できない" do
      @address.postal_cord = ""
      @address.valid?
      expect(@address.errors.full_messages).to include("Order must exist")
    end
    it "郵便番号はハイフンがなければがなければ登録できない" do
      @address.postal_cord = "1111111"
      @address.valid?
      expect(@address.errors.full_messages).to include("Order must exist")
    end
    it "都道府県がなければ登録できない" do
      @address.prefecture_id = ""
      @address.valid?
      expect(@address.errors.full_messages).to include("Order must exist")
    end
    it "市区町村がなければ登録できない" do
      @address.municipality = ""
      @address.valid?
      expect(@address.errors.full_messages).to include("Order must exist")
    end
    it "番地がなければ登録できない" do
      @address.address = ""
      @address.valid?
      expect(@address.errors.full_messages).to include("Order must exist")
    end
    it "電話番号がなければ登録できない" do
      @address.phone_number = ""
      @address.valid?
      expect(@address.errors.full_messages).to include("Order must exist")
    end
  end
end
