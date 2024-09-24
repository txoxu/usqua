# frozen_string_literal: true

class UpdateCocktailTastingsTable < ActiveRecord::Migration[7.1]
  def change
    remove_column :cocktail_tastings, :tasting_recipe
    remove_column :cocktail_tastings, :cocktail_flavor

    add_column :cocktail_tastings, :others, :string
    add_column :cocktail_tastings, :aroma, :decimal
    add_column :cocktail_tastings, :flavor, :decimal
    add_column :cocktail_tastings, :appearance, :decimal
    add_column :cocktail_tastings, :finish, :decimal
    add_column :cocktail_tastings, :mouthfeel, :decimal
  end
end
