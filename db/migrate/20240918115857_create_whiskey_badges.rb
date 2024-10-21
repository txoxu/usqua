# frozen_string_literal: true

# ウイスキーの称号テーブル
class CreateWhiskeyBadges < ActiveRecord::Migration[7.1]
  def change
    create_table :whiskey_badges do |t|
      t.string :name
      t.string :description
      t.json :conditions

      t.timestamps
    end
  end
end
