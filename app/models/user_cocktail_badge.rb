class UserCocktailBadge < ApplicationRecord
  belongs_to :user
  belongs_to :cocktail_badge
end
