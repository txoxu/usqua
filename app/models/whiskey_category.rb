# frozen_string_literal: true
# whiskeyとcategoryの中間テーブル
class WhiskeyCategory < ApplicationRecord
  belongs_to :whiskey
  belongs_to :category
end
