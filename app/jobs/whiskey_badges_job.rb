# frozen_string_literal: true

# ウイスキーの称号ロジック
class WhiskeyBadgesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    user_id = args[0]
    whiskey_id = args[1]

    user = User.find(user_id)
    whiskey = Whiskey.find(whiskey_id)

    WhiskeyBadge.all.each do |badge|
      conditions = badge.conditions
      if meets_conditions?(conditions, whiskey, user)
        user.assign_badge(badge)
      end
    end
  end

  private

  def meets_conditions?(conditions, _whiskey, user)
    case conditions['type']

    when 'new_whiskey_count'
      user.whiskeys.count == conditions['count']
    when 'ten_whiskey_count'
      user.whiskeys.count == conditions['count']
    when 'twenty_whiskey_count'
      user.whiskeys.count == conditions['count']
    when 'fifty_whiskey_count'
      user.whiskeys.count == conditions['count']
    when 'one_hundred_whiskey_count'
      user.whiskeys.count == conditions['count']
    else
      false
    end
  end
end
