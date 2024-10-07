# frozen_string_literal: true

# テイスティングテーブルを変更
class UpdateTastingsTable < ActiveRecord::Migration[7.1]
  def up
    change_table :tastings, bulk: true do |t|
      t.remove :aroma
      t.remove :flavor

      t.decimal :aroma
      t.decimal :flavor
      t.decimal :body
      t.decimal :finish
      t.decimal :balance
    end
  end

  def down
    change_table :tastings, bulk: true do |t|
      t.remove :aroma, :flavor, :body, :finish, :balance
      t.string :aroma
      t.string :flavor
    end
  end
end
