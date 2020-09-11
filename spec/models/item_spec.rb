require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end
  
  describe '商品の出品機能' do
    context '商品の登録ができるとき' do
     it 'image,name,commit.price,user_id,category_id,status_id,deliverifee_id,areaofdelivery_id,daysunilshipping_idが条件通りに存在しているとき' do
      expect(@item).to be_valid
     end
    end
    context '商品が登録できないとき' do
      it 'nameが空のときは登録できない'do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'commentが空のときは登録ができない' do
        @item.comment = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Comment can't be blank")
      end
      it 'imageが空のときは登録ができない' do
        @item.image= nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'priceが空のときは登録ができない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが半角数字ではないときは登録ができない' do
        @item.price = '３００'   #全角で記述
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが300以下のときは登録ができない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが9,999,999以上のときは登録ができない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'category_idが空のときは登録ができない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number", "Category can't be blank")
      end
      it 'category_idが1のときは登録ができない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'status_idが空のときは登録ができない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status is not a number", "Status can't be blank")
      end
      it 'status_idが1のときは登録ができない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it 'deliveryfee_idが空のときは登録ができない' do
        @item.deliveryfee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliveryfee is not a number", "Deliveryfee can't be blank")
      end
      it 'deliveryfee_idが1のときは登録ができない' do
        @item.deliveryfee_id= '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliveryfee must be other than 1")
      end
      it 'areaofdelivery_idが空のときは登録ができない' do
        @item.areaofdelivery_id= ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Areaofdelivery is not a number", "Areaofdelivery can't be blank")
      end
      it 'areaofdelivery_idが1のときは登録ができない' do
        @item.areaofdelivery_id= '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Areaofdelivery must be other than 1")
      end
      it 'daysunilshipping_idが空のときは登録ができない' do
        @item.daysunilshipping_id= ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Daysunilshipping is not a number", "Daysunilshipping can't be blank")
      end
      it 'daysunilshipping_idが1のときは登録ができない' do
        @item.daysunilshipping_id= '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Daysunilshipping must be other than 1")
      end
    end
  end

end


