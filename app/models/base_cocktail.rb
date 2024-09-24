# frozen_string_literal: true

class BaseCocktail < ApplicationRecord
  has_many :cocktails
  belongs_to :whiskey_badge
  belongs_to :cocktail_badge
end
