# frozen_string_literal: true

# カクテルの称号テーブル
class CreateCocktailBadges < ActiveRecord::Migration[7.1]
  def change
    create_table :cocktail_badges do |t|
      t.string :name
      t.string :description
      t.json :conditions

      t.timestamps
    end
  end
end
