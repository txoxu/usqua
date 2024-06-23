# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create categories by name
category_names = [
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

category_names.each do |category_name|
  category_types.each do |category_type|
    Category.create(category_name: category_name, category_type: category_type)
  end
end

puts "Categories seeded successfully."
