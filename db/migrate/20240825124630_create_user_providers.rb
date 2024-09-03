class CreateUserProviders < ActiveRecord::Migration[7.1]
  def change
    create_table :user_providers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end
end
