require 'rails_helper'

RSpec.describe PurchaseBuyer, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_buyer = FactoryBot.build(:purchase_buyer, item_id: item.id, user_id: user.id)
  end

  describe '商品購入機能' do
    context '商品が購入できる時' do
      it '入力が適正であれば購入できる' do
      end
    end
  

    context '商品が購入できない時' do
      it '' do
      end
      it '' do
      end
      it '' do
      end
      it '' do
      end
      it '' do
      end
      it '' do
      end
      it '' do
      end





    end
  end
end