class CreateTastings < ActiveRecord::Migration[7.1]
  def change
    create_table :tastings do |t|

      t.timestamps
    end
  end
end
