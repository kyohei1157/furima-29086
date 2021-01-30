require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    it "商品名がなければ登録できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "商品画像がなければ登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "商品説明がなければ登録できない" do
      @item.explanation = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it "カテゴリーがなければ登録できない" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it "商品の状態がなければ登録できない" do
      @item.status_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it "配送料の負担がなければ登録できない" do
      @item.shipping_fee_burden_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee burden can't be blank")
    end
    it "発送元の地域がなければ登録できない" do
      @item.prefecture_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "発送までの日数がなければ登録できない" do
      @item.days_to_ship_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship can't be blank")
    end
    it "販売価格の記入がなければ登録できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "価格が半角英字の場合登録できない" do
      @item.price = "aaaaaa"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters.")
    end
    it "価格が全角数字の場合登録できない" do
      @item.price = "１２３４５"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters.")
    end
    it "価格が¥300~¥9,999,999ではない場合登録できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it "category_idが1の場合登録できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1" )
    end
    it "status_idが1の場合登録できない" do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1" )
    end
    it "shipping_fee_burden_idが1の場合登録できない" do
      @item.shipping_fee_burden_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee burden must be other than 1" )
    end
    it "prefecture_idが1の場合登録できない" do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1" )
    end
    it "days_to_ship_idが1の場合登録できない" do
      @item.days_to_ship_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship must be other than 1" )
    end
    it "価格が¥10,000,000以上の場合登録できない" do
      @item.price = 10000001
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
  end
end