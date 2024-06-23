class CreateTastings < ActiveRecord::Migration[7.1]
  def change
    create_table :tastings do |t|
      t.string :aroma
      t.string :flavor
      t.string :tasting_text
      t.string :tasting_type


      t.timestamps
    end
  end
end
