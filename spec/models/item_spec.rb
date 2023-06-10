require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:itam)
  end

  describe '出品情報の保存' do
    context '出品情報が保存できるとき' do
      it 'item_name,price,text,category_id,item_status_is,postage_bare_id,prefecture_id,days_ship_id,user_idが正しく存在すれば保存できる' do
      end
    end

    context '出品情報が保存できないとき' do
      it 'item_nameが空だと出品できない' do
      end

      it 'priceが空だと出品できない' do
      end

      it 'priceが299以下だと出品できない' do
      end

      it 'priceが10,000,000以上だと出品できない' do
      end

      it 'textが空だと出品できない' do
      end

      it 'category_idが1だと出品できない' do
      end

      it 'item_status_idが1だと出品できない' do
      end

      it 'postage_bare_idが1だと出品できない' do
      end

      it 'prefecture_idが1だと出品できない' do
      end
      
      it 'days_ship_idが1だと出品できない' do
      end

      it 'ユーザーが紐づいていなければ出品できない' do
      end
      end
    end
  end
end
