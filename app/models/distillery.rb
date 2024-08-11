class Distillery < ApplicationRecord
  belongs_to :region

  scope :keyword, -> (word) { where('distillery_name LIKE ? or prefectures LIKE ?', "%#{word}%", "%#{word}%") }
end
