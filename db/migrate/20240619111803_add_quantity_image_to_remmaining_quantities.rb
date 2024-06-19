class AddQuantityImageToRemmainingQuantities < ActiveRecord::Migration[7.1]
  def change
    add_column :remmaining_quantities, :quantity_image, :string
  end
end
