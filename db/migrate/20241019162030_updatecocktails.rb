class Updatecocktails < ActiveRecord::Migration[7.1]
  def change
    add_column :cocktails, :cocktail_image, :string
  end
end
