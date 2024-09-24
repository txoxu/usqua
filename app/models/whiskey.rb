class Whiskey < ApplicationRecord
  has_many :whiskey_categories, dependent: :destroy
  has_many :categories, through: :whiskey_categories
  has_many :tastings, dependent: :destroy
  has_many :cocktail_tastings, dependent: :destroy
  belongs_to :user
  belongs_to :remmaining_quantity, optional: true

  mount_uploader :image, ImageUploader, ignore_integrity_errors: true

  validates :name, presence: true
  validate :validate_image

  scope :by_category_ids, ->(ids) { joins(:categories).where(categories: { id: ids }) }
  scope :name_contain, ->(word) { where('name LIKE ?', "%#{word}%") }
  scope :text_contain, ->(word) { where('text LIKE ?', "%#{word}%") }

  def assign_remmaining_quantity(quantity)
    self.remmaining_quantity = quantity.presence || nil
  end

  def assign_image(image)
    self.image = image.presence || File.open(Rails.root.join('app', 'assets', 'images', 'default.jpg'))
  end

  private

  def validate_image
    return unless image.present? && !image.file.extension.in?(%w[jpg jpeg png gif])

    errors.add(:image, 'は jpg, jpeg, png, gif のいずれかの形式でアップロードしてください')
  end
end
