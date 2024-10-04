# frozen_string_literal: true

# テイスティングテーブルを変更
class UpdateTastingsTable < ActiveRecord::Migration[7.1]
  def change
    change_table :tastings, bulk: true do |t|
      t.remove :aroma, :string
      t.remove :flavor, :string

      t.decimal :aroma, precision: 4, scale: 2
      t.decimal :flavor, precision: 4, scale: 2
      t.decimal :body, precision: 4, scale: 2
      t.decimal :finish, precision: 4, scale: 2
      t.decimal :balance, precision: 4, scale: 2
    end
  end
end

