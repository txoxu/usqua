# frozen_string_literal: true

# カクテルのベースとなるウイスキーの種類のモデル
class BaseCocktail < ApplicationRecord
  has_many :cocktails, dependent: :destroy
end
