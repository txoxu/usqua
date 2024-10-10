# frozen_string_literal: true

# ウイスキーの称号条件ロジック
class WhiskeyBadgeService
  def initialize(user, whiskey)
    @user = user
    @whiskey = whiskey
  end

  def assign_badges
    WhiskeyBadge.all.find_each do |badge|
      conditions = badge.conditions
      if meets_conditions?(conditions)
        @user.assign_badge(badge)
      else
        Rails.logger.info "Badge not assigned: #{badge.name}"
      end
    end
  end

  private

  def meets_conditions?(conditions)
    case conditions['type']
    when 'new_whiskey_count'
      @user.whiskeys.count == conditions['count']
    else
      false
    end
  end
end
