class CocktailTasting < ApplicationRecord
  has_many :cocktail_tastings_whiskeys
  belongs_to :cocktail
end
