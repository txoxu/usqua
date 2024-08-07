class Cocktail < ApplicationRecord
  has_many :cocktail_tastings
  
  scope :keyword, -> (word) { where('cocktail_name LIKE ? OR cocktail_create LIKE ? OR cocktail_origin LIKE ? OR cocktail_recipe LIKE ?', "%#{word}%", "%#{word}%", "%#{word}%", "%#{word}%") }
end
