# frozen_string_literal: true

# カクテルテイスティングテーブルの文字数を変更
class UpdateCocktailTastingsTable2 < ActiveRecord::Migration[7.1]
  def up
    change_table :cocktail_tastings, bulk: true do |t|
      t.change :aroma, :decimal, precision: 4, scale: 2
      t.change :flavor, :decimal, precision: 4, scale: 2
      t.change :appearance, :decimal, precision: 4, scale: 2
      t.change :finish, :decimal, precision: 4, scale: 2
      t.change :mouthfeel, :decimal, precision: 4, scale: 2
    end
  end

  def down
    change_table :cocktail_tastings do |t|
      t.change :aroma, :decimal
      t.change :flavor, :decimal
      t.change :appearance, :decimal
      t.change :finish, :decimal
      t.change :mouthfeel, :decimal
    end
  end
end
