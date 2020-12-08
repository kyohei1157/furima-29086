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
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      user = FactoryBot.build(:user)
      user.password = ""
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
      user.valid?
      expect(user.errors.full_messages).to include("Password_confirmation can't be blank")
    end
    it "nameが空では登録できない" do
      user = FactoryBot.build(:user)
      user.name = ""
      user.valid?
      expect(user.errors.full_messages).to include("Password_confirmation can't be blank")
    end
    it "surname_firiganaが空では登録できない" do
      user = FactoryBot.build(:user)
      user.surname_firigana = ""
      user.valid?
      expect(user.errors.full_messages).to include("Password_confirmation can't be blank")
    end
    it "name_firiganaが空では登録できない" do
      user = FactoryBot.build(:user)
      user.name_firigana = ""
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