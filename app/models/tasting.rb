class Tasting < ApplicationRecord
  belongs_to :whiskey
  has_many :tasting_tags, dependent: :destroy
  has_many :tags, through: :tasting_tags

  def save_tags(tag_list)
    tag_list.each do |tag_name|
      tag = Tag.find_or_create_by(tag_name: tag_name.strip)
      self.tags << tag unless self.tags.exists?(tag.id)
    end
  end
end