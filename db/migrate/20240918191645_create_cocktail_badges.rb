# frozen_string_literal: true

class CreateCocktailBadges < ActiveRecord::Migration[7.1]
  def change
    create_table :cocktail_badges do |t|
      t.string :name
      t.string :description
      t.json :conditions
      t.references :category, foreign_key: true
      t.references :base_cocktail, foreign_key: true

      t.timestamps
    end
  end
end
