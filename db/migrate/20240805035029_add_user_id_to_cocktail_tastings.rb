# frozen_string_literal: true

# userとcacktailtastingを関連付け
class AddUserIdToCocktailTastings < ActiveRecord::Migration[7.1]
  def change
    add_reference :cocktail_tastings, :user, foreign_key: true
  end
end
