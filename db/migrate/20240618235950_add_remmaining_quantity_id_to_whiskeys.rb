# frozen_string_literal: true

# whiskeyとremmainingquantityを関連付け
class AddRemmainingQuantityIdToWhiskeys < ActiveRecord::Migration[7.1]
  def change
    add_reference :whiskeys, :remmaining_quantity, foreign_key: true
  end
end
