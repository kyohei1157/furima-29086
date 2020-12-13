require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.nickname = ""
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = FactoryBot.build(:user)
      user.email = ""
      user.email = "sample123gmail.com"
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      user = FactoryBot.build(:user)
      user.password = ""
      user.password = "aaaaaa"
      user.password = "123456"
      user.password = "ａａａ１２３"
      user.password = "aaa12"
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "password_confirmationが空では登録できない" do
      user = FactoryBot.build(:user)
      user.password_confirmation = ""
      user.valid?
      expect(user.errors.full_messages).to include("Password_confirmation can't be blank")
    end
    it "surnameが空では登録できない" do
      user = FactoryBot.build(:user)
      user.surname = ""
      user.surname = "123"
      user.valid?
      expect(user.errors.full_messages).to include("Password_confirmation can't be blank")
    end
    it "nameが空では登録できない" do
      user = FactoryBot.build(:user)
      user.name = ""
      user.name = "456"
      user.valid?
      expect(user.errors.full_messages).to include("Password_confirmation can't be blank")
    end
    it "surname_firiganaが空では登録できない" do
      user = FactoryBot.build(:user)
      user.surname_firigana = ""
      user.surname_firigana = "あいうえお"
      user.valid?
      expect(user.errors.full_messages).to include("Password_confirmation can't be blank")
    end
    it "name_firiganaが空では登録できない" do
      user = FactoryBot.build(:user)
      user.name_firigana = ""
      user.name_firigana = "かきくけこ"
      user.valid?
      expect(user.errors.full_messages).to include("Password_confirmation can't be blank")
    end
    it "birthdayが空では登録できない" do
      user = FactoryBot.build(:user)
      user.birthday = ""
      user.valid?
      expect(user.errors.full_messages).to include("Password_confirmation can't be blank")
    end
  end
end