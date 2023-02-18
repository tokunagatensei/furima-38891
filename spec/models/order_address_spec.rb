require 'rails_helper'

RSpec.describe OrderAddress, type: :model do

  describe '購入情報登録' do
    before do
      user = FactoryBot.build(:user)
      item = FactoryBot.build(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user, item_id: item)
    end

    context '購入情報が登録できる場合' do

      it '必要な項目が存在すれば登録できる' do
        expect(@order_address).to be_valid
      end

      it '建物名が空でも保存できる' do
        @order_address.building = nil
        expect(@order_address).to be_valid
      end

    end

    context '購入情報が登録できない場合' do

      it 'user_idが空では登録できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "User can't be blank"
      end

      it 'item_idが空では登録できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Item can't be blank"
      end

      it '郵便番号が空では登録できない' do
        @order_address.post_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Post code can't be blank"
      end

      it '郵便番号にハイフンがないと登録できない' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Post code is invalid"
      end

      it '都道府県が「---」では登録できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Prefecture must be other than 1"
      end

      it '市区町村が空では登録できない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City can't be blank"
      end

      it '番地が空では登録できない' do
        @order_address.block = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Block can't be blank"
      end

      it '電話番号が空では登録できない' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number can't be blank"
      end

      it '電話番号にハイフンがあると登録できない' do
        @order_address.phone_number = "090-1234-5678"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is invalid"
      end

      it '電話番号が12桁以上あると登録できない' do
        @order_address.phone_number = "012345678910"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is invalid"
      end

      it '電話番号が9桁以下では登録できない' do
        @order_address.phone_number = "123456789"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is invalid"
      end

      it 'トークンが空では登録できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Token can't be blank"
      end

    end

  end

end
