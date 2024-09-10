class AddCocktailIdToCocktailTastings < ActiveRecord::Migration[7.1]
  def change
    # Add the cocktail_id column
    add_reference :cocktail_tastings, :cocktail, foreign_key: true
  end
end
