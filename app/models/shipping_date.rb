class ShippingDate < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '1〜2日'},
    { id: 3, name: '3〜7日'},
    { id: 4, name: '1週間〜2週間'},
    { id: 5, name: '2週間〜1ヶ月'},
    { id: 6, name: '1ヶ月以上'}
  ]
  include ActiveHash::Associations
  has_many :items
end