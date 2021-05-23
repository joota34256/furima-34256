class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :category
  belongs_to :prefecture
  belongs_to :shipping_charge
  belongs_to :shipping_date
  belongs_to :state
  belongs_to :user

  has_one_attached :image

  with_options presence:true do
    validates :name
    validates :description
    validates :image
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :prefecture_id
      validates :shipping_charge_id
      validates :shipping_date_id
      validates :state_id
    end
  
  end

end
