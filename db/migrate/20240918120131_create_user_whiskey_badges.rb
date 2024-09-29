# frozen_string_literal: true
# userとwhiskeybadgeを関連付け
class CreateUserWhiskeyBadges < ActiveRecord::Migration[7.1]
  def change
    create_table :user_whiskey_badges do |t|
      t.references :user, null: false, foreign_key: true
      t.references :whiskey_badge, null: false, foreign_key: true
      t.boolean :seen, default: false

      t.timestamps
    end
    add_index :user_whiskey_badges, %i[user_id whiskey_badge_id], unique: true
  end
end
