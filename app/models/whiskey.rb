class Whiskey < ApplicationRecord
  has_many :whiskey_categories, dependent: :destroy
  has_many :categories, through: :whiskey_categories
  has_many :tastings, dependent: :destroy
  belongs_to :user
  has_one :remmaining_quantity, dependent: :destroy

  mount_uploader :image, ImageUploader

  
  validates :name, presence: true, uniqueness: true

  scope :by_category_ids, -> (ids) { joins(:categories).where(categories: { id: ids }) }
  scope :name_contain, -> (word) { where('name LIKE ?', "%#{word}%") }
  scope :text_contain, -> (word) { where('text LIKE ?', "%#{word}%") }
end
