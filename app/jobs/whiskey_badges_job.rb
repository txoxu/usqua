class WhiskeyBadgesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    user_id = args[0]
    whiskey_id = args[1]

    user = User.find(user_id)
    whiskey = Whiskey.find(whiskey_id)
    Rails.logger.info "User found: #{user.id}, Whiskey found: #{whiskey.id}"

    WhiskeyBadge.all.each do |badge|
      conditions = badge.conditions
      Rails.logger.info "Evaluating badge: #{badge.name} with conditions: #{conditions}"
      if meets_conditions?(conditions, whiskey, user)
        user.assign_badge(badge)
        Rails.logger.info "Badge assigned: #{badge.name} to user: #{user.id}"
      else
        Rails.logger.info "Badge not assigned: #{badge.name}"
      end
    end
  end

  private

  def meets_conditions?(conditions, _whiskey, user)
    case conditions['type']

    when 'new_whiskey_count'
      user.whiskeys.count >= conditions['count']
    end
  end
end
