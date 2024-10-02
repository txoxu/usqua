# frozen_string_literal: true

# userとwhiskeyを関連付け
class AddUserIdToWhiskeys < ActiveRecord::Migration[7.1]
  def change
    add_reference :whiskeys, :user, null: false, default: 1, foreign_key: true
  end
end
