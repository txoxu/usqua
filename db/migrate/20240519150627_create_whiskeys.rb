class CreateWhiskeys < ActiveRecord::Migration[7.1]
  def change
    create_table :whiskeys do |t|
      t.string :name
      t.string :text
      t.string :image

      t.timestamps
    end
  end
end
