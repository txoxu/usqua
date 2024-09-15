class UpdateCocktailTastingsTable2 < ActiveRecord::Migration[7.1]
  def change

    change_column :cocktail_tastings, :aroma, :decimal, precision: 4, scale: 2
    change_column :cocktail_tastings, :flavor, :decimal, precision: 4, scale: 2
    change_column :cocktail_tastings, :appearance, :decimal, precision: 4, scale: 2
    change_column :cocktail_tastings, :finish, :decimal, precision: 4, scale: 2
    change_column :cocktail_tastings, :mouthfeel, :decimal, precision: 4, scale: 2
  end
end
