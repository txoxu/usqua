# frozen_string_literal: true

class CreateCocktailTastings < ActiveRecord::Migration[7.1]
  def change
    create_table :cocktail_tastings do |t|
      t.string :tasting_recipe
      t.string :cocktail_flavor

      t.timestamps
    end
  end
end
