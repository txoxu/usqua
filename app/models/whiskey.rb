class Whiskey < ApplicationRecord
  has_many :whiskey_categories, dependent: :destroy
  has_many :categories, through: :whiskey_categories
  has_one :tasting, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :name, presence: true, uniqueness: true
end
