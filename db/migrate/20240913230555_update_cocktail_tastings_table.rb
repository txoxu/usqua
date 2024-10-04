# frozen_string_literal: true

# カクテルテイスティングテーブルを変更
class UpdateCocktailTastingsTable < ActiveRecord::Migration[7.1]
  def change
    change_table :cocktail_tastings, bulk: true do |t|
      t.remove :tasting_recipe
      t.remove :cocktail_flavor

      t.string :others
      t.decimal :aroma
      t.decimal :flavor
      t.decimal :appearance
      t.decimal :finish
      t.decimal :mouthfeel
    end
  end
end
