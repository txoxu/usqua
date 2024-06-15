class Tag < ApplicationRecord
  has_many :category_tags
  has_many :categories, through: :category_tags
  has_many :tasting_tags
  has_many :tastings, through: :tasting_tags
  validates :tag_name, uniqueness: true
end
