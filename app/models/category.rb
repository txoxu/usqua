class Category < ApplicationRecord
  has_many :whiskey_categories
  has_many :whiskeys, through: :whiskey_categories

  enum name: [:american_whiskey, :scotch_whiskey, :canadian_whiskey, :japanese_whiskey, :irish_whiskey]
  enum category_type: [:single_malt, :single_grain, :blended, :blended_malt, :blended_grain]

end
