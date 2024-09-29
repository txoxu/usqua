# frozen_string_literal: true
# カクテルテイスティングモデル
class CocktailTasting < ApplicationRecord
  belongs_to :cocktail
  belongs_to :whiskey
  belongs_to :user
end
