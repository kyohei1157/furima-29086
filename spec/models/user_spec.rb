require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "password_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "surnameが空では登録できない" do
      @user.surname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname can't be blank")
    end
    it "nameが空では登録できない" do
      @user.name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it "surname_furiganaが空では登録できない" do
      @user.surname_furigana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname furigana can't be blank")
    end
    it "name_furiganaが空では登録できない" do
      @user.name_furigana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name furigana can't be blank")
    end
    it "birthdayが空では登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it "メールアドレスに@が含まれていない場合登録できない" do
      @user.email = "sample123gmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "パスワードが5文字以下の場合登録できない" do
      @user.password = "aaa12"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)")
    end
    it "パスワードが半角英字のみの場合登録できない" do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "パスワードが半角数字のみの場合登録できない" do
      @user.password = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "パスワードが全角英数字の場合登録できない" do
      @user.password = "ａａａ１２３"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid. Input half-width characters.")
    end
    it "姓が全角（漢字・ひらがな・カタカナ）以外の場合登録できない" do
      @user.surname = "123"
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname is invalid. Input full-width characters.")
    end
    it "名が全角（漢字・ひらがな・カタカナ）以外の場合登録できない" do
      @user.name = "456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Name is invalid. Input full-width characters.")
    end
    it "姓のフリガナが全角（カタカナ）以外の場合登録できない" do
      @user.surname_furigana = "あいうえお"
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname furigana is invalid. Input full-width katakana characters.")
    end
    it "名のフリガナが全角（カタカナ）以外の場合登録できない" do
      @user.name_furigana = "かきくけこ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Name furigana is invalid. Input full-width katakana characters.")
    end
    it "メールアドレスが登録済みの場合登録できない" do
      @user.save
      @another_user = FactoryBot.build(:user)
      @another_user.email = @user.email
      @another_user.valid?
      expect(@another_user.errors.full_messages).to include("Email has already been taken")
    end
  end
end