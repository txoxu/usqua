class AddForeignKeyToWhiskeys < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :whiskeys, :users
  end
end
