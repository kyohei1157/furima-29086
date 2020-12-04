require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
    user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", surname: "aaa", name: "bbb", surname_firigana: "aaa", name_firigana: "bbb", birthday: "1234")
      user.valid?
      bexpect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = User.new(nickname: "aaa", email: "", password: "00000000", password_confirmation: "00000000", surname: "aaa", name: "bbb", surname_firigana: "aaa", name_firigana: "bbb", birthday: "1234")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      user = User.new(nickname: "aaa", email: "kkk@gmail.com", password: "", password_confirmation: "00000000", surname: "aaa", name: "bbb", surname_firigana: "aaa", name_firigana: "bbb", birthday: "1234")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "password_confirmationが空では登録できない" do
      user = User.new(nickname: "aaa", email: "kkk@gmail.com", password: "00000000", password_confirmation: "", surname: "aaa", name: "bbb", surname_firigana: "aaa", name_firigana: "bbb", birthday: "1234")
      user.valid?
      expect(user.errors.full_messages).to include("Password_confirmation can't be blank")
    end
    it "surnameが空では登録できない" do
      user = User.new(nickname: "aaa", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", surname: "", name: "bbb", surname_firigana: "aaa", name_firigana: "bbb", birthday: "1234")
      user.valid?
      expect(user.errors.full_messages).to include("Password_confirmation can't be blank")
    end
    it "nameが空では登録できない" do
      user = User.new(nickname: "aaa", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", surname: "aaa", name: "", surname_firigana: "aaa", name_firigana: "bbb", birthday: "1234")
      user.valid?
      expect(user.errors.full_messages).to include("Password_confirmation can't be blank")
    end
    it "surname_firiganaが空では登録できない" do
      user = User.new(nickname: "aaa", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", surname: "aaa", name: "bbb", surname_firigana: "", name_firigana: "bbb", birthday: "1234")
      user.valid?
      expect(user.errors.full_messages).to include("Password_confirmation can't be blank")
    end
    it "name_firiganaが空では登録できない" do
      user = User.new(nickname: "aaa", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", surname: "aaa", name: "bbb", surname_firigana: "aaa", name_firigana: "", birthday: "1234")
      user.valid?
      expect(user.errors.full_messages).to include("Password_confirmation can't be blank")
    end
    it "birthdayが空では登録できない" do
      user = User.new(nickname: "aaa", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", surname: "aaa", name: "bbb", surname_firigana: "aaa", name_firigana: "bbb", birthday: "")
      user.valid?
      expect(user.errors.full_messages).to include("Password_confirmation can't be blank")
    end
  end
end