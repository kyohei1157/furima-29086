require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    it "nicknameが空だと登録できない" do
      @user = FactoryBot.build(:user)
      @user.nickname = ""
      @user.valid?
      binding.pry
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user = FactoryBot.build(:user)
      @user.email = ""
      @user.valid?
      binding.pry
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      @user = FactoryBot.build(:user)
      @user.password = ""
      @user.valid?
      binding.pry
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "password_confirmationが空では登録できない" do
      @user = FactoryBot.build(:user)
      @user.password_confirmation = ""
      @user.valid?
      binding.pry
      expect(user.errors.full_messages).to include("Password_confirmation can't be blank")
    end
    it "surnameが空では登録できない" do
      @user = FactoryBot.build(:user)
      @user.surname = ""
      @user.valid?
      binding.pry
      expect(user.errors.full_messages).to include("Password_confirmation can't be blank")
    end
    it "nameが空では登録できない" do
      @user = FactoryBot.build(:user)
      @user.name = ""
      @user.valid?
      binding.pry
      expect(user.errors.full_messages).to include("Password_confirmation can't be blank")
    end
    it "surname_firiganaが空では登録できない" do
      @user = FactoryBot.build(:user)
      @user.surname_firigana = ""
      @user.valid?
      binding.pry
      expect(user.errors.full_messages).to include("Password_confirmation can't be blank")
    end
    it "name_firiganaが空では登録できない" do
      @user = FactoryBot.build(:user)
      @user.name_firigana = ""
      @user.valid?
      binding.pry
      expect(user.errors.full_messages).to include("Password_confirmation can't be blank")
    end
    it "birthdayが空では登録できない" do
      @user = FactoryBot.build(:user)
      @user.birthday = ""
      @user.valid?
      binding.pry
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
    it "メールアドレスに@が含まれていない場合登録できない" do
      @user = FactoryBot.build(:user)
      @user.email = "sample123gmail.com"
      @user.valid?
      binding.pry
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "パスワードが5文字以下の場合登録できない" do
      @user = FactoryBot.build(:user)
      @user.password = "aaa12"
      @user.valid?
      binding.pry
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードが半角英字のみの場合登録できない" do
      @user = FactoryBot.build(:user)
      @user.password = "aaaaaa"
      @user.valid?
      binding.pry
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードが半角数字のみの場合登録できない" do
      @user = FactoryBot.build(:user)
      @user.password = "123456"
      @user.valid?
      binding.pry
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードが全角英数字の場合登録できない" do
      @user = FactoryBot.build(:user)
      @user.password = "ａａａ１２３"
      @user.valid?
      binding.pry
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "姓が全角（漢字・ひらがな・カタカナ）以外の場合登録できない" do
      @user = FactoryBot.build(:user)
      @user.surname = "123"
      @user.valid?
      binding.pry
      expect(user.errors.full_messages).to include("Surname can't be blank")
    end
    it "名が全角（漢字・ひらがな・カタカナ）以外の場合登録できない" do
      @user = FactoryBot.build(:user)
      @user.name = "456"
      @user.valid?
      binding.pry
      expect(user.errors.full_messages).to include("Name can't be blank")
    end
    it "姓のフリガナが全角（カタカナ）以外の場合登録できない" do
      @user = FactoryBot.build(:user)
      @user.surname_firigana = "あいうえお"
      @user.valid?
      binding.pry
      expect(user.errors.full_messages).to include("Surname_firigana can't be blank")
    end
    it "名のフリガナが全角（カタカナ）以外の場合登録できない" do
      @user = FactoryBot.build(:user)
      @user.name_firigana = "かきくけこ"
      @user.valid?
      binding.pry
      expect(user.errors.full_messages).to include("Name_firigana can't be blank")
    end
  end
end