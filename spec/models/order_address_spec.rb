require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

  describe '商品購入時の住所情報の保存' do

    context '住所情報が保存できるとき' do
      it 'post_code,prefecture_id,cities,address,building,tel_numberが全て正しく存在すれば保存できる' do
        expect(@address).to be_valid
      end

      it 'buildingが空でも保存できる' do
        @address.building = ''
        expect(@address).to be_valid
      end

      it 'tel-numberが11桁でも保存できる' do
        @address.tel_number = '09012345678'
        expect(@address).to be_valid
      end
    end

    context '商品購入情報が保存できないとき' do
      it 'post_codeが空では保存できない' do
        @address.post_code = nil
        @address.valid?
        binding.pry
      end
      it 'post_codeに-がなければ保存できない' do
      end
      it 'post_codeの-の前の数字が3桁でなければ保存できない' do
      end
      it 'post_codeの-の後の数字が4桁でなければ保存できない' do
      end
      it 'prefecture_idが1だと保存できない' do
      end
      it 'citiesが空では保存できない' do
      end
      it 'addressが空では保存できない' do
      end
      it 'tel_numberが空では保存できない' do
      end
      it 'tel_numberが9桁以下では保存できない' do
      end
      it 'Tel_numberが12桁以上では保存できない' do
      end
      it 'orderが紐づいていなければ出品できない' do
      end
    end

  end
end
