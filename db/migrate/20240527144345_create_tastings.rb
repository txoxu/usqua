class CreateTastings < ActiveRecord::Migration[7.1]
  def change
    create_table :tastings do |t|
      t.string :aroma
      t.string :flavor
      t.string :tasting_text


      t.timestamps
    end
  end
end
