# frozen_string_literal: true

# テイスティングの称号ロジック
class TastingBadgesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    user_id = args[0]
    tasting_id = args[1]

    user = User.find(user_id)
    tasting = Tasting.find(tasting_id)

    WhiskeyBadge.find_each do |badge|
      conditions = badge.conditions
      user.assign_badge(badge) if meets_conditions?(conditions, tasting, user)
    end
  end

  private

  def meets_conditions?(conditions, _tasting, user)
    valid_types = %w[new_tasting_count ten_tasting_count twenty_tasting_count fifty_tasting_count
                     one_hundred_tasting_count]

    if valid_types.include?(conditions['type'])
      user.whiskeys.flat_map(&:tastings).count == conditions['count']
    else
      false
    end
  end
end
