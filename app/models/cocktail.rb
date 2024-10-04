# frozen_string_literal: true

# カクテルモデル
class Cocktail < ApplicationRecord
  belongs_to :base_cocktail
  has_many :cocktail_tastings, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  scope :keyword, lambda { |word|
  query = %w[cocktail_name cocktail_create cocktail_origin cocktail_recipe]
            .map { |column| "#{column} LIKE :word" }
            .join(' OR ')
  where(query, word: "%#{word}%")
}
end
