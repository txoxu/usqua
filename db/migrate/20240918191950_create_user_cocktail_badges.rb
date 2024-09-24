# frozen_string_literal: true

class CreateUserCocktailBadges < ActiveRecord::Migration[7.1]
  def change
    create_table :user_cocktail_badges do |t|
      t.references :user, null: false, foreign_key: true
      t.references :cocktail_badge, null: false, foreign_key: true
      t.boolean :seen, default: false

      t.timestamps
    end
    add_index :user_cocktail_badges, %i[user_id cocktail_badge_id], unique: true
  end
end
