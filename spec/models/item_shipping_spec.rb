require 'rails_helper'

RSpec.describe ItemShipping, type: :model do
  before do
    @itemshipping = FactoryBot.build(:item_shipping)
  end
  describe '配送先情報の登録' do
    context '配送先が登録できるとき' do
      it 'postalcode,municipalities,areaofdelivery_id,address,buildingname,phonenumber,user_id,item_id,tokenが存在しているとき' do
        expect(@itemshipping).to be_valid
      end
      it 'buildingnameはなくても登録できる' do
        @itemshipping.buildingname = ''
        expect(@itemshipping).to be_valid
      end
    end
    context '配送先が登録できないとき' do
      it 'postalcodeが空のとき' do
        @itemshipping.postalcode = ''
        @itemshipping.valid?
        expect(@itemshipping.errors.full_messages).to include("Postalcode can't be blank", 'Postalcode is invalid')
      end
      it 'postalcodeが数字の3桁ハイフン４桁の形式ではない場合' do
        @itemshipping.postalcode = '11111111'
        @itemshipping.valid?
        expect(@itemshipping.errors.full_messages).to include('Postalcode is invalid')
      end
      it 'areaofdelivery_idを選択してないとき' do
        @itemshipping.areaofdelivery_id = ''
        @itemshipping.valid?
        expect(@itemshipping.errors.full_messages).to include("Areaofdelivery can't be blank", 'Areaofdelivery is not a number')
      end
      it 'areaofdelivery_idが１を選択されたとき' do
        @itemshipping.areaofdelivery_id = '1'
        @itemshipping.valid?
        expect(@itemshipping.errors.full_messages).to include('Areaofdelivery must be other than 1')
      end
      it 'municipalitiesが空のとき' do
        @itemshipping.municipalities = ''
        @itemshipping.valid?
        expect(@itemshipping.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空のとき' do
        @itemshipping.address = ''
        @itemshipping.valid?
        expect(@itemshipping.errors.full_messages).to include("Address can't be blank")
      end
      it 'phonenumberが空のとき' do
        @itemshipping.phonenumber = ''
        @itemshipping.valid?
        expect(@itemshipping.errors.full_messages).to include("Phonenumber can't be blank")
      end
      it 'phonenumberがハイフンを含まない11桁の数字ではないとき' do
        @itemshipping.phonenumber = '111-1111-1111'
        @itemshipping.valid?
        expect(@itemshipping.errors.full_messages).to include('Phonenumber is invalid')
      end
      it 'user_idが存在しないとき' do
        @itemshipping.user_id = ''
        @itemshipping.valid?
        expect(@itemshipping.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが存在しないとき' do
        @itemshipping.item_id = ''
        @itemshipping.valid?
        expect(@itemshipping.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが存在しないとき' do
        @itemshipping.token = ''
        @itemshipping.valid?
        expect(@itemshipping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
