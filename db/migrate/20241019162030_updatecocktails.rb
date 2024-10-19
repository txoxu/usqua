# frozen_string_literal: true

# cocktailsテーブルにcocktail_imageカラムを追加
class Updatecocktails < ActiveRecord::Migration[7.1]
  def change
    add_column :cocktails, :cocktail_image, :string
  end
end
