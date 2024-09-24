# frozen_string_literal: true

class UserWhiskeyBadge < ApplicationRecord
  belongs_to :user
  belongs_to :whiskey_badge
end
