class AddForeignKeysToCocktailTastingsWhiskeys < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :cocktail_tastings_whiskeys, :whiskeys
    add_foreign_key :cocktail_tastings_whiskeys, :cocktail_tastings
  end
end
