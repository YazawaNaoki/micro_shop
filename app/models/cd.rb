class Cd < ApplicationRecord
  belongs_to :product

  has_many :musics, inverse_of: :cd, :dependent => :destroy
  accepts_nested_attributes_for :musics, reject_if: :all_blank, allow_destroy: true
end
