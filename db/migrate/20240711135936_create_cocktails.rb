# frozen_string_literal: true

# カクテルテーブル
class CreateCocktails < ActiveRecord::Migration[7.1]
  def change
    create_table :cocktails do |t|
      t.string :cocktail_name
      t.text :cocktail_create
      t.text :cocktail_origin
      t.text :cocktail_recipe
      t.text :cocktail_url

      t.timestamps
    end
  end
end
