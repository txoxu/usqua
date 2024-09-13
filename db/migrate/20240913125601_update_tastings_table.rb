class UpdateTastingsTable < ActiveRecord::Migration[7.1]
  def change

    remove_column :tastings, :aroma, :string
    remove_column :tastings, :flavor, :string
    

    add_column :tastings, :aroma, :decimal
    add_column :tastings, :flavor, :decimal
    add_column :tastings, :body, :decimal
    add_column :tastings, :finish, :decimal
    add_column :tastings, :balance, :decimal
  end
end
