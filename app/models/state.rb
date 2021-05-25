class State < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '未使用' },
    { id: 3, name: '未使用に近い' },
    { id: 4, name: 'やや傷、汚れあり' },
    { id: 5, name: '傷、汚れあり' },
    { id: 6, name: '大きな傷、汚れあり' }
  ]
  include ActiveHash::Associations
  has_many :items
end
