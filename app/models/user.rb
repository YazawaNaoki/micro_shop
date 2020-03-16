class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  accepts_nested_attributes_for :addresses, allow_destroy: true

  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  has_many :orders

  with_options presence: true do
    validates :last_name
    validates :given_name
    validates :last_name_furigana
    validates :given_name_furigana
    validates :phone_number
  end
end
