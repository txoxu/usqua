# frozen_string_literal: true

class AddWhiskeyIdToTastings < ActiveRecord::Migration[7.1]
  def change
    add_reference :tastings, :whiskey, null: false, foreign_key: true
  end
end
