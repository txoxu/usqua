class Cocktail < ApplicationRecord
  belongs_to :base_cocktail
  belongs_to :user
  has_many :cocktail_tastings
  has_many :bookmarks

  scope :keyword, lambda { |word|
                    where('cocktail_name LIKE ? OR cocktail_create LIKE ? OR cocktail_origin LIKE ? OR cocktail_recipe LIKE ?', "%#{word}%", "%#{word}%", "%#{word}%", "%#{word}%")
                  }
end
