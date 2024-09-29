# frozen_string_literal: true
# userとcocktail_badgeの中間テーブル
class UserCocktailBadge < ApplicationRecord
  belongs_to :user
  belongs_to :cocktail_badge
end
