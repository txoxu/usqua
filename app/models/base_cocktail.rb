# frozen_string_literal: true

# カクテルのベースとなるウイスキーの種類のモデル
class BaseCocktail < ApplicationRecord
  has_many :cocktails, dependent: :destroy
  belongs_to :whiskey_badge
  belongs_to :cocktail_badge
end
