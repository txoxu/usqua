# frozen_string_literal: true

class WhiskeyCategory < ApplicationRecord
  belongs_to :whiskey
  belongs_to :category
end
