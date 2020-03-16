class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address

  has_many :order_products, dependent: :destroy
  accepts_nested_attributes_for :order_products, allow_destroy: true

  validates :address_id, presence: true

  enum pay_method: { クレジットカード: 0, 銀行振込: 1, 代引き: 2 }
  enum order_status: { 注文受付: 0, 発送中: 1, 発送済: 2 }
end
