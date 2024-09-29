# frozen_string_literal: true

# whiskeyとtastingを関連付け
class AddWhiskeyIdToTastings < ActiveRecord::Migration[7.1]
  def change
    add_reference :tastings, :whiskey, null: false, foreign_key: true, default: 1 # 適切なデフォルト値に置き換えてください
  end
end
