class RemoveRemmainingQuantityFromWhiskeys < ActiveRecord::Migration[7.1]
  def change
    remove_column :whiskeys, :remmaining_quantity, :integer
  end
end
