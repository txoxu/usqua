class Cocktail < ApplicationRecord
  belogs_to: user
  belogs_to: category
end
