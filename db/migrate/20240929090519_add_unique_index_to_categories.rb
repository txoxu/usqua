# frozen_string_literal: true

# typeとnameに一意制約
class AddUniqueIndexToCategories < ActiveRecord::Migration[7.1]
  def change
    add_index :categories, %i[category_name category_type], unique: true
  end
end
