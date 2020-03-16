class Arrival < ApplicationRecord
  belongs_to :product
  validates :count, numericality: { only_integer: true, greater_than: 0 }
end
