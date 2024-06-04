class AddTastingTypeToTastings < ActiveRecord::Migration[7.1]
  def change
    add_column :tastings, :tasting_type, :string
  end
end
