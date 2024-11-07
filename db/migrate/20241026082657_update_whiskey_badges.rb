# frozen_string_literal: true

# ウイスキーの称号に画像を保存できるようにカラムを追加
class UpdateWhiskeyBadges < ActiveRecord::Migration[7.1]
  def change
    add_column :whiskey_badges, :badge_image, :string
  end
end
