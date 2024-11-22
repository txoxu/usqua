# frozen_string_literal: true

# ウイスキーのテイスティングモデル
class Tasting < ApplicationRecord
  belongs_to :whiskey

  validates :tasting_type, presence: true
  validates :aroma, presence: true
  validates :flavor, presence: true

end
