class Buyer < ApplicationRecord
  belongs_to :purchase

  with_options presence: true do
    validates :postal_code ,numericality: { only_integer: true } 
    validates :prefecture_id , numericality: { other_than: 1 } 
    validates :city
    validates :address
    validates :phone_number
  end
end
