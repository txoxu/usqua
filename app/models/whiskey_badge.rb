class WhiskeyBadge < ApplicationRecord
  has_many :user_whiskey_badges
  has_many :users, through: :user_whiskey_badges
  has_many :categories
  has_many :whiskeys
  has_many :base_cocktails
end
