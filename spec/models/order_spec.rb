require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品購入' do
    it "カード情報がなければ登録できない" do
      @order.card_number = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("Card_number can't be blank")
    end
    it "有効期限の月がないと登録できない" do
      @order.month = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("Month can't be blank")
    end
    it "有効期限の年がないと登録できない" do
      @order.year = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("Year can't be blank")
    end
    it "セキュリティコードがなければ登録できない" do
      @order.security_code = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("Security_code can't be blank")
    end
    it "郵便番号がなければ登録できない" do
      @order.postal_code = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal_code can't be blank")
    end
    it "都道府県がなければ登録できない" do
      @order.prefecture_id = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "市区町村がなければ登録できない" do
      @order.municipality = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("Municipality can't be blank")
    end
    it "番地がなければ登録できない" do
      @order.address = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end
    it "電話番号がなければ登録できない" do
      @order.phone_number = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone_number can't be blank")
    end
  end
end
