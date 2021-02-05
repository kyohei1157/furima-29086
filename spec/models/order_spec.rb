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
    it "カード情報が半角英数字でなければ登録できない" do
      @order.card_number = "１１２２３３４４５５６６７７８８"
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
  end
end

