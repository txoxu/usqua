# frozen_string_literal: true

# テイスティングテーブルの文字数を変更
class UpdateTastingsTable2 < ActiveRecord::Migration[7.1]
  def change
    change_table :tastings, bulk: true do |t|
      t.decimal :aroma, precision: 4, scale: 2
      t.decimal :flavor, precision: 4, scale: 2
      t.decimal :body, precision: 4, scale: 2
      t.decimal :finish, precision: 4, scale: 2
      t.decimal :balance, precision: 4, scale: 2
    end
  end
end
