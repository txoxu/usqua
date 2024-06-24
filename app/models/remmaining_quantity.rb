class RemmainingQuantity < ApplicationRecord
  has_many :whiskeys

  validates :quantity, presence: true
end
