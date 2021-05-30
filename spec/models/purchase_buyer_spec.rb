require 'rails_helper'

RSpec.describe PurchaseBuyer, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_buyer = FactoryBot.build(:purchase_buyer, item_id: item.id, user_id: user.id)
    sleep(1)
  end

  describe '商品購入機能' do
    context '商品が購入できる時' do
      it '入力が適正であれば購入できる' do
        expect(@purchase_buyer).to be_valid
      end
      it '建物名が抜けていても登録できる' do
        @purchase_buyer.building_number = ""
        expect(@purchase_buyer).to be_valid
      end
    end
    context '商品が購入できない時' do
      it '郵便番号が空だと購入できない' do
        @purchase_buyer.postal_code = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンがないと購入できない' do
        @purchase_buyer.postal_code = 1_111_111
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include('Postal code is invalid')
      end

      it '都道府県idが1だと購入できない' do
        @purchase_buyer.prefecture_id = 1
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it '市町村が空だと購入できない' do
        @purchase_buyer.city = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと購入できない' do
        @purchase_buyer.address = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空だと購入できない' do
        @purchase_buyer.phone_number = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が11桁以下でないと購入できない' do
        @purchase_buyer.phone_number = '0123456789012'
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it '電話番号が英字複合では登録できない' do
        @purchase_buyer.phone_number = '0123456ab'
        @purchase_buyer.valid?
        binding.pry
        expect(@purchase_buyer.errors.full_messages).to include('Phone number is not a number')
      end
      it 'userが紐づいていないと購入できない' do
        @purchase_buyer.user_id = nil
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと購入できない' do
        @purchase_buyer.item_id = nil
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Item can't be blank")
      end

      it 'トークンがないと購入できない' do
        @purchase_buyer.token = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
