require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do
    context '商品の出品ができる場合' do
      it 'item_nameとitem_description、category_id,item_status_id,ship_chaege_id,prefectre_id,ship_date_id,price,user,imageが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品の出品が上手くいかない時' do
      it 'item_nameが空だと出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it 'item_descriptionが空だと出品できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item description can't be blank"
      end
      it 'category_idが空だと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'item_stasus_idが空だと出品できない' do
        @item.item_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item status can't be blank"
      end
      it 'ship_charge_idが空だと出品できない' do
        @item.ship_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Ship charge can't be blank"
      end
      it 'prefecture_idが空だと出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'ship_date_idが空だと出品できない' do
        @item.ship_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Ship date can't be blank"
      end
      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'priceが299円以下だと出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it 'priceが10,000,000円以上だと出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
      it 'priceが半角数字以外だと出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
    end
  end  
end
