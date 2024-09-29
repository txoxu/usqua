# frozen_string_literal: true
# ウイスキーの残量モデル
class RemmainingQuantity < ApplicationRecord
  has_many :whiskeys, dependent: :destroy
end
