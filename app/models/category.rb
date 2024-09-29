# frozen_string_literal: true
# ウイスキーの種類や原産国別のカテゴリモデル
class Category < ApplicationRecord
  has_many :whiskey_categories, dependent: :destroy
  has_many :whiskeys, through: :whiskey_categories, dependent: :destroy
  has_many :cocktails
  belongs_to :whiskey_badge
  belongs_to :cocktail_badge

  validates :category_name, presence: true
  validates :category_type, presence: true

  enum category_name: {
    'アメリカンウイスキー' => 'american_whiskey',
    'スコッチウイスキー' => 'scotch_whiskey',
    'カナディアンウイスキー' => 'canadian_whiskey',
    'ジャパニーズウイスキー' => 'japanese_whiskey',
    'アイリッシュウイスキー' => 'irish_whiskey'
  }

  enum category_type: {
    'シングルモルトウイスキー' => 'single_malt',
    'シングルグレーンウイスキー' => 'single_grain',
    'ブレンデッドウイスキー' => 'blended',
    'ブレンデッドモルトウイスキー' => 'blended_malt',
    'ブレンデッドグレーンウイスキー' => 'blended_grain'
  }
end
