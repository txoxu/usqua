class Whiskey < ApplicationRecord
  has_many :whiskey_categories
  has_many :categories, through: :whiskey_categories
end
