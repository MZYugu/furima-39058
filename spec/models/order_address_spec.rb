require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  describe '商品購入時の住所情報の保存' do

    context '住所情報が保存できるとき' do
      it 'post_code,prefecture_id,cities,address,building,tel_numberが全て正しく存在すれば保存できる' do
        expect(@order_address).to be_valid
      end

      it 'buildingが空でも保存できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end

      it 'tel-numberが11桁でも保存できる' do
        @order_address.tel_number = '01234567890'
        expect(@order_address).to be_valid
      end
    end

    context '商品購入情報が保存できないとき' do
      it 'post_codeが空では保存できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeに-がなければ保存できない' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include( "Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeの-の前の数字が3桁でなければ保存できない' do
        @order_address.post_code = '12-34567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include( "Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeの-の後の数字が4桁でなければ保存できない' do
        @order_address.post_code = '1234-567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include( "Post code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが1だと保存できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'citiesが空では保存できない' do
        @order_address.cities = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Cities can't be blank")
      end
      it 'addressが空では保存できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'tel_numberが空では保存できない' do
        @order_address.tel_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number can't be blank")
      end
      it 'tel_numberが9桁以下では保存できない' do
        @order_address.tel_number = '012345678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number is invalid. Exclude hyphen(-)")
      end
      it 'tel_numberが12桁以上では保存できない' do
        @order_address.tel_number = '012345678901'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number is invalid. Exclude hyphen(-)")
      end
      it 'tel_numberに半角英数字以外が含まれていると保存できない' do
        @order_address.tel_number = '012-３4五-67'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number is invalid. Exclude hyphen(-)")
      end
      it 'itemが紐づいていなければ出品できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'userが紐づいていなければ保存できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'tokenが空では保存できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end

  end
end
