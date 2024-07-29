class CreateJoinTableWhiskeysCocktailTastings < ActiveRecord::Migration[7.1]
  def change
    create_join_table :whiskeys, :cocktail_tastings do |t|
      t.index [:whiskey_id, :cocktail_tasting_id]
      t.index [:cocktail_tasting_id, :whiskey_id]
    end
  end
end
