# frozen_string_literal: true

# テイスティングテーブルの文字数を変更
class UpdateTastingsTable2 < ActiveRecord::Migration[7.1]
  def up
    change_table :tastings, bulk: true do |t|
      t.change :aroma, :decimal, precision: 4, scale: 2
      t.change :flavor, :decimal, precision: 4, scale: 2
      t.change :body, :decimal, precision: 4, scale: 2
      t.change :finish, :decimal, precision: 4, scale: 2
      t.change :balance, :decimal, precision: 4, scale: 2
    end
  end

  def down
    change_table :tastings, bulk: true do |t|
      t.change :aroma, :decimal
      t.change :flavor, :decimal
      t.change :body, :decimal
      t.change :finish, :decimal
      t.change :balance, :decimal
    end
  end
end
