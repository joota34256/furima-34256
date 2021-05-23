class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :password,format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ }
    
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/} do
      validates :first_name_kanji
      validates :last_name_kanji
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :first_name_kana
      validates :last_name_kana
    end
  end
end
