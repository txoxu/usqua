# frozen_string_literal: true

class CocktailBadge < ApplicationRecord
  has_many :user_cocktail_badges
  has_many :users, through: :user_cocktail_badges
  has_many :categories
  has_many :whiskeys
  has_many :base_cocktails
end
