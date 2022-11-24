require 'rails_helper'
RSpec.describe OrderAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    context '商品購入情報が保存できる場合' do
      it 'user_id,item_id,postal_code,prefecture_id,city,block,phone_number,tokenが存在すれば保存できる' do
        expect(@order_address).to be_valid
      end
      it 'postal_codeが「3桁+ハイフン+4桁」であれば保存できる' do
        @order_address.postal_code = '123-1234'
        expect(@order_address).to be_valid
      end
      it 'buildingが空でも登録できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
      it 'phone_numberが11桁全て半角数字であれば保存できる' do
        @order_address.phone_number = '09012345678'
        expect(@order_address).to be_valid
      end
    end
    context '商品購入情報が保存できない場合' do
      it 'user_idが空だと保存できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'posral_codeが空だと保存できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'prefecture_idが空だと保存できない' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空だと保存できない' do
        @order_address.block = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numderが12桁以上だと保存できない' do
        @order_address.phone_number = '090123412345'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number input oniy number')
      end
      it 'tokenが空だと保存できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
