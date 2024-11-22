# frozen_string_literal: true

# 1対多の関係で外部キーを設定
class AddRegionToDistilleries < ActiveRecord::Migration[7.1]
  def change
    return if column_exists?(:distilleries, :region_id)

    add_column :distilleries, :region_id, :integer
  end
end
