# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create categories by name
names = [
  'american_whiskey',
  'scotch_whiskey',
  'canadian_whiskey',
  'japanese_whiskey',
  'irish_whiskey'
]

# Create categories by category_type
category_types = [
  'single_malt',
  'single_grain',
  'blended',
  'blended_malt',
  'blended_grain'
]

# Create category records
names.each do |name|
  category_types.each do |category_type|
    new_category = Category.find_or_create_by!(name: I18n.t("names.#{name}"), category_type: I18n.t("category_types.#{category_type}"))
    puts "Created category: #{new_category.name} - #{new_category.category_type}"
  end
end
