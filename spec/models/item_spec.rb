require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    it 'contentとimageが存在していれば保存できること' do
      expect(@item).to be_valid
    end
    it 'imageが空では保存できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_items).to include("Image can't be blank")
    end
    it 'contentが空では保存できないこと' do
      @item.content = nil
      @item.valid?
      expect(@item.errors.full_items).to include("Content can't be blank")
    end
  end
end
