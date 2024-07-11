class CreateCocktails < ActiveRecord::Migration[7.1]
  def change
    create_table :cocktails do |t|
      t.string :cocktail_name
      t.string :cocktail_recipe
      t.string :cocktail_url


      t.timestamps
    end
  end
end
