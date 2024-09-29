# frozen_string_literal: true
# テイスティングテーブルを変更
class UpdateTastingsTable < ActiveRecord::Migration[7.1]
  def change
    remove_column :tastings, :aroma, :string
    remove_column :tastings, :flavor, :string

    add_column :tastings, :aroma, :decimal, precision: 4, scale: 2
    add_column :tastings, :flavor, :decimal, precision: 4, scale: 2
    add_column :tastings, :body, :decimal, precision: 4, scale: 2
    add_column :tastings, :finish, :decimal, precision: 4, scale: 2
    add_column :tastings, :balance, :decimal, precision: 4, scale: 2
  end
end
