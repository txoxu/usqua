class Category < ApplicationRecord
  has_many :whiskey_categories
  has_many :whiskeys, through: :whiskey_categories

  validates :category_name, presence: true, uniqueness: { scope: :category_type }
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
