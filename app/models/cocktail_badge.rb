# frozen_string_literal: true
# カクテル用の称号モデル
class CocktailBadge < ApplicationRecord
  has_many :user_cocktail_badges, dependent: :destroy
  has_many :users, through: :user_cocktail_badges, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :whiskeys, dependent: :destroy
  has_many :base_cocktails, dependent: :destroy
end
