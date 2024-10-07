# frozen_string_literal: true

# ベースカクテルテーブル
class CreateBaseCocktails < ActiveRecord::Migration[7.1]
  def change
    create_table :base_cocktails do |t|
      t.string :base_name, null: false

      t.timestamps
    end
  end
end
