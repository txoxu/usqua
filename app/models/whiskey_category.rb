class WhiskeyCategory < ApplicationRecord
  belongs_to :whiskey
  belongs_to :category
end
