# frozen_string_literal: true
# お気に入り登録のモデル
class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :cocktail

  validates :user_id, uniqueness: { scope: :cocktail_id }
end
