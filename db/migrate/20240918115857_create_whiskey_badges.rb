# frozen_string_literal: true
# ウイスキーの称号テーブル
class CreateWhiskeyBadges < ActiveRecord::Migration[7.1]
  def change
    create_table :whiskey_badges do |t|
      t.string :name
      t.string :description
      t.json :conditions
      t.references :category, foreign_key: true
      t.references :base_cocktail, foreign_key: true

      t.timestamps
    end
  end
end
