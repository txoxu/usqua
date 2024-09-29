# frozen_string_literal: true

# ウイスキーのテイスティングモデル
class Tasting < ApplicationRecord
  belongs_to :whiskey

  validates :tasting_type, presence: true
  validates :aroma, presence: true
  validates :flavor, presence: true

  def save_tags(tag_list)
    tag_list.each do |tag_name|
      tag = Tag.find_or_create_by(tag_name: tag_name.strip)
      tags << tag unless tags.exists?(tag.id)
    end
  end
end
