# frozen_string_literal: true
# テイスティングテーブルの文字数を変更
class UpdateTastingsTable2 < ActiveRecord::Migration[7.1]
  def change
    change_column :tastings, :aroma, :decimal, precision: 4, scale: 2
    change_column :tastings, :flavor, :decimal, precision: 4, scale: 2
    change_column :tastings, :body, :decimal, precision: 4, scale: 2
    change_column :tastings, :finish, :decimal, precision: 4, scale: 2
    change_column :tastings, :balance, :decimal, precision: 4, scale: 2
  end
end
