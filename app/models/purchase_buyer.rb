class PurchaseBuyer
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building_number, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, numericality: { only_integer: true }, length: { maximum: 11 }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Buyer.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address,
                 building_number: building_number, phone_number: phone_number, purchase_id: purchase.id)
  end
end
