class CocktailTastingWhiskey < ApplicationRecord
  belongs_to :Whiskey
  belongs_to :cocktail_tasting
end
