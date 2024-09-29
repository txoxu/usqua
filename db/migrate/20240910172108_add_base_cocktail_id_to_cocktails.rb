# frozen_string_literal: true

# cocktailとbasecocktailを関連付
class AddBaseCocktailIdToCocktails < ActiveRecord::Migration[7.1]
  def change
    return if column_exists?(:cocktails, :base_cocktail_id)

    add_reference :cocktails, :base_cocktail, foreign_key: true
  end
end
