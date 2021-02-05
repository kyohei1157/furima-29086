require 'rails_helper'

RSpec.describe AddressForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @address_form = FactoryBot.build(:address_form, user_id: @user.id, item_id: @item.id )
    sleep 0.1
  end
  describe '商品購入' do
    context '内容に問題ない場合' do
      it 'buildingnameが空でも登録できる' do
        @address_form.buildingname = ""
        expect(@address_form.valid?).to eq true
      end
      it 'buildingnameがあっても登録できる' do
        expect(@address_form.valid?).to eq true
      end
    end
    context '内容に問題がある場合' do
    it "郵便番号がなければ登録できない" do
      @address_form.postal_cord = ""
      @address_form.valid?
      expect(@address_form.errors.full_messages).to include("Postal cord can't be blank")
    end
    it "郵便番号はハイフンがなければがなければ登録できない" do
      @address_form.postal_cord = "1111111"
      @address_form.valid?
      expect(@address_form.errors.full_messages).to include("Postal cord is invalid. Include hyphen(-)")
    end
    it "都道府県がなければ登録できない" do
      @address_form.prefecture_id = ""
      @address_form.valid?
      expect(@address_form.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "市区町村がなければ登録できない" do
      @address_form.municipality = ""
      @address_form.valid?
      expect(@address_form.errors.full_messages).to include("Municipality can't be blank")
    end
    it "番地がなければ登録できない" do
      @address_form.address = ""
      @address_form.valid?
      expect(@address_form.errors.full_messages).to include("Address can't be blank")
    end
    it "電話番号がなければ登録できない" do
      @address_form.phone_number = ""
      @address_form.valid?
      expect(@address_form.errors.full_messages).to include("Phone number can't be blank")
    end
    it "電話番号が12桁以上では登録できない" do
      @address_form.phone_number = "0901234567891"
      @address_form.valid?
      expect(@address_form.errors.full_messages).to include("Phone number is too long (maximum is 12 characters)")
    end
    it "電話番号が英数混合では登録できない" do
      @address_form.phone_number = "090aabb2233"
      @address_form.valid?
      expect(@address_form.errors.full_messages).to include("Phone number is invalid. Input half-width characters.")
    end
    it "tokenがなければ登録できない" do
      @address_form.token = ""
      @address_form.valid?
      expect(@address_form.errors.full_messages).to include("Token can't be blank")
    end
    it "prefecture_idが1だと登録できない" do
      @address_form.prefecture_id = 1
      @address_form.valid?
      expect(@address_form.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it "user_idがなければ登録できない" do
      @address_form.user_id = ""
      @address_form.valid?
      expect(@address_form.errors.full_messages).to include("User can't be blank")
    end
    it "item_idがなければ登録できない" do
      @address_form.item_id = ""
      @address_form.valid?
      expect(@address_form.errors.full_messages).to include("Item can't be blank")
    end
  end
  end
end 

