require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe "ユーザー新規登録" do
    it "nickname,email,password,password_confirmation,lastname_kanji,firstname_kanji,lastname_katakana,firstname_katakana,birthdayが正しく存在すれば登録できる" do
    end
    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
    end
    it "重複したemailが存在すると登録できない" do
    end
    it "emailに@が含まれていないと登録できない" do
    end
    it "passwordが空だと登録できない" do
    end
    it "passwordが5文字以下だと登録できない" do
    end
    it "passwordが英数混合でないと登録できない" do
    end
    it "passwordとpassword_confirmationが一致していないと登録できない" do
    end
    it "lastname_kanjiが空だと登録できない" do
    end
    it "lastname_kanjiが全角（漢字・ひらがな・カタカナ）でないと登録できない" do
    end
    it "firstname_kanjiが空だと登録できない" do
    end
    it "firstname_kanjiが全角（漢字・ひらがな・カタカナ）でないと登録できない" do
    end
    it "lastname_katakanaが空だと登録できない" do
    end
    it "lastname_katakanaが全角（カタカナ）でないと登録できない" do
    end
    it "firstname_katakanaが空だと登録できない" do
    end
    it "firstname_katakanaが全角（カタカナ）でないと登録できない" do
    end
    it "birthdayが空だと登録できない" do
    end
    it "" do
    end
  end
  
end
