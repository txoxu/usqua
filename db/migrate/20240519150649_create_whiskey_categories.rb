# frozen_string_literal: true

# whiskeyとcategoryの中間テーブル
class CreateWhiskeyCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :whiskey_categories do |t|
      t.references :whiskey, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
