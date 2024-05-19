class CreateWhiskeys < ActiveRecord::Migration[7.1]
  def change
    create_table :whiskeys do |t|
      t.string :name
      t.string :text
      t.blob :image
      t.integer :remmaining_quantity

      t.timestamps
    end
  end
end
