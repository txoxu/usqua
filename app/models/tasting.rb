class Tasting < ApplicationRecord
  belongs_to :whiskey
  has_many :tasting_tags, dependent: :destroy
  has_many :tags, through: :tasting_tags
end
