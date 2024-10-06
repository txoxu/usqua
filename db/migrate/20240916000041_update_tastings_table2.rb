# frozen_string_literal: true

# テイスティングテーブルの文字数を変更
class UpdateTastingsTable2 < ActiveRecord::Migration[7.1]
  def change
    change_table :tastings, bulk: true do |t|
      t.change :aroma, precision: 4, scale: 2
      t.change :flavor, precision: 4, scale: 2
      t.change :body, precision: 4, scale: 2
      t.change :finish, precision: 4, scale: 2
      t.change :balance, precision: 4, scale: 2
    end
  end
end
