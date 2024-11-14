# frozen_string_literal: true

# カクテルの称号テーブルに画像を追加できるカラムを追加
class UpdateCocktailBadges < ActiveRecord::Migration[7.1]
  def change
    add_column :cocktail_badges, :badge_image, :string
  end
end
