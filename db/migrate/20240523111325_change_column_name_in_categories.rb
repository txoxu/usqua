class ChangeColumnNameInCategories < ActiveRecord::Migration[7.1]
  def change
    rename_column :categories, :name, :category_name
  end
end
