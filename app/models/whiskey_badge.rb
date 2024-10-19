# frozen_string_literal: true

# ウイスキーの称号モデル
class WhiskeyBadge < ApplicationRecord
  has_many :user_whiskey_badges, dependent: :destroy
  has_many :users, through: :user_whiskey_badges, dependent: :destroy
end
