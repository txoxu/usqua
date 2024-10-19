# frozen_string_literal: true

# カクテル用の称号モデル
class CocktailBadge < ApplicationRecord
  has_many :user_cocktail_badges, dependent: :destroy
  has_many :users, through: :user_cocktail_badges, dependent: :destroy
end
