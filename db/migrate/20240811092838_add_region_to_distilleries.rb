class AddRegionToDistilleries < ActiveRecord::Migration[7.1]
  def change
    add_reference :distilleries, :region, null: false, foreign_key: true
  end
end
