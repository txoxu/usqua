class Cocktail < ApplicationRecord
  belongs_to :user
  scope :keyword, -> (word) { where('cocktail_name LIKE ? OR cocktail_create LIKE ? OR cocktail_origin LIKE ? OR cocktail_recipe LIKE ?', "%#{word}%", "%#{word}%", "%#{word}%", "%#{word}%") }
end
