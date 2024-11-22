# frozen_string_literal: true

# 蒸溜所を区分する地方テーブル
class CreateRegions < ActiveRecord::Migration[7.1]
  def change
    create_table :regions, if_not_exists: true do |t|
      t.string :region_name

      t.timestamps
    end
  end
end
