# frozen_string_literal: true

# ウイスキーの称号ロジック
class WhiskeyBadgesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    user_id = args[0]
    whiskey_id = args[1]

    user = User.find(user_id)
    whiskey = Whiskey.find(whiskey_id)

    WhiskeyBadge.find_each do |badge|
      conditions = badge.conditions
      user.assign_badge(badge) if meets_conditions?(conditions, whiskey, user)
    end
  end

  private

  def meets_conditions?(conditions, _whiskey, user)
    valid_types = %w[new_whiskey_count ten_whiskey_count twenty_whiskey_count fifty_whiskey_count
                     one_hundred_whiskey_count]

    if valid_types.include?(conditions['type'])
      user.whiskeys.count == conditions['count']
    else
      false
    end
  end
end
