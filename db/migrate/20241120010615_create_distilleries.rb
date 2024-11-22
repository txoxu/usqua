# frozen_string_literal: true

# 蒸溜所を保存しているテーブル
class CreateDistilleries < ActiveRecord::Migration[7.1]
  def change
    create_table :distilleries, if_not_exists: true do |t|
      t.string :distillery_name

      t.timestamps
    end
  end
end
