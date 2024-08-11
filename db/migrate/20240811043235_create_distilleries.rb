class CreateDistilleries < ActiveRecord::Migration[7.1]
  def change
    create_table :distilleries do |t|
      t.string :distillery_name
      t.string :distillery_url
      t.string :prefectures

      t.timestamps
    end
  end
end
