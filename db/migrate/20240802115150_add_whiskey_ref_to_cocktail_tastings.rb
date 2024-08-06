class AddWhiskeyRefToCocktailTastings < ActiveRecord::Migration[7.1]
  def change
    add_reference :cocktail_tastings, :whiskey, null: false, foreign_key: true
  end
end
