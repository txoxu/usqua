# frozen_string_literal: true

class CreateTastingTags < ActiveRecord::Migration[7.1]
  def change
    create_table :tasting_tags do |t|
      t.references :tasting, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
