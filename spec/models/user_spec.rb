require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe "ユーザー新規登録" do
    context "新規登録できるとき" do
      it "nickname,email,password,password_confirmation,lastname_kanji,firstname_kanji,lastname_katakana,firstname_katakana,birthdayが正しく存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context "新規登録できないとき" do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在すると登録できない" do
        @user.save
        user1 = FactoryBot.build(:user)
        user1.email = @user.email
        user1.valid?
        expect(user1.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに@が含まれていないと登録できない" do
        @user.email = 'testmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下だと登録できない" do
        @user.password = 'a1b2'
        @user.password_confirmation = 'a1b2'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが英数混合でないと登録できない" do
        @user.password = 'asdfghjk'
        @user.password_confirmation = 'asdfghjk'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordとpassword_confirmationが一致していないと登録できない" do
        @user.password = 'q1w2e3r4'
        @user.password_confirmation = 'a2s3d4f5'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "lastname_kanjiが空だと登録できない" do
        @user.lastname_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kanji can't be blank")
      end
      it "lastname_kanjiが全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.lastname_kanji = Faker::Name.last_name
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kanji is invalid")
      end
      it "firstname_kanjiが空だと登録できない" do
        @user.firstname_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kanji can't be blank")
      end
      it "firstname_kanjiが全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.firstname_kanji = Faker::Name.first_name
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kanji is invalid")
      end
      it "lastname_katakanaが空だと登録できない" do
        @user.lastname_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname katakana can't be blank")
      end
      it "lastname_katakanaが全角（カタカナ）でないと登録できない" do
        @user.lastname_katakana = Gimei.last.hiragana
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname katakana is invalid")
      end
      it "firstname_katakanaが空だと登録できない" do
        @user.firstname_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname katakana can't be blank")
      end
      it "firstname_katakanaが全角（カタカナ）でないと登録できない" do
        @user.firstname_katakana = Gimei.first.hiragana
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname katakana is invalid")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end

  end
end
