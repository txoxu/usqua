# frozen_string_literal: true

# userとwhiskey_badgeの中間テーブル
class UserWhiskeyBadge < ApplicationRecord
  belongs_to :user
  belongs_to :whiskey_badge
end
