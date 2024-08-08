class AddUserIdToCocktailTastings < ActiveRecord::Migration[7.1]
  def change
    add_reference :cocktail_tastings, :user, null: false, foreign_key: true
  end
end
