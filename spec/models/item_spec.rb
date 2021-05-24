require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規出品機能' do
    context '商品が登録できる時' do
      it '入力が適正であれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が登録できない時' do
      it '画像がないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと登録できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明がないと登録できない' do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーidが1だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'カテゴリーidが13以上だと登録できない' do
        @item.category_id = 13
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be less than or equal to 12")
      end
      it '商品の状態idが1だと登録できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 1")
      end
      it '商品の状態idが7以上だと登録できない' do
        @item.state_id = 7
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be less than or equal to 6")
      end
      it '配送料の負担idが1だと登録できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
      end
      it '配送料の負担idが4以上だと登録できない' do
        @item.shipping_charge_id = 4
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge must be less than or equal to 3")
      end
      it '配送元地域idが1だと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '配送元地域idが49以上だと登録できない' do
        @item.prefecture_id = 49
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be less than or equal to 48")
      end
      it '発送日数idが1だと登録できない' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date must be other than 1")
      end
      it '発送日数idが7以上だと登録できない' do
        @item.shipping_date_id = 7
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date must be less than or equal to 6")
      end
      it '販売価格がないと登録できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が300円以下だと登録できない' do
        @item.price = 290
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '販売価格が10000000円以上だと登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '販売価格が全角数字だと登録できない' do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '販売価格が半角英数字複合では登録できない' do
        @item.price = "1000a"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '販売価格が半角英字のみでは登録できない' do
        @item.price = "aaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'userが紐づいていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

    end
  end

end
