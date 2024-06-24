class Whiskey < ApplicationRecord
  has_many :whiskey_categories, dependent: :destroy
  has_many :categories, through: :whiskey_categories
  has_many :tastings, dependent: :destroy
  belongs_to :user
  belongs_to :remmaining_quantity

  mount_uploader :image, ImageUploader, ignore_integrity_errors: true
  attr_accessor :category_names
  attr_accessor :category_types
  
  validates :name, presence: true, uniqueness: true
  validate :validate_image

  scope :by_category_ids, -> (ids) { joins(:categories).where(categories: { id: ids }) }
  scope :name_contain, -> (word) { where('name LIKE ?', "%#{word}%") }
  scope :text_contain, -> (word) { where('text LIKE ?', "%#{word}%") }

  private

  def validate_image
    return unless image.present? && !image.file.extension.in?(%w[jpg jpeg png gif])

    errors.add(:image, 'は jpg, jpeg, png, gif のいずれかの形式でアップロードしてください')
  end
end
