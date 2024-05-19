# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Category.create([
  { name: 'american_whiskey', category_type: 'single_malt' },
  { name: 'american_whiskey', category_type: 'single_grain' },
  { name: 'american_whiskey', category_type: 'blended' },
  { name: 'american_whiskey', category_type: 'blended_malt' },
  { name: 'american_whiskey', category_type: 'blended_grain' },
  { name: 'scotch_whiskey', category_type: 'single_malt' },
  { name: 'scotch_whiskey', category_type: 'single_grain' },
  { name: 'scotch_whiskey', category_type: 'blended' },
  { name: 'scotch_whiskey', category_type: 'blended_malt' },
  { name: 'scotch_whiskey', category_type: 'blended_grain' },
  { name: 'canadian_whiskey', category_type: 'single_malt' },
  { name: 'canadian_whiskey', category_type: 'single_grain' },
  { name: 'canadian_whiskey', category_type: 'blended' },
  { name: 'canadian_whiskey', category_type: 'blended_malt' },
  { name: 'canadian_whiskey', category_type: 'blended_grain' },
  { name: 'japanese_whiskey', category_type: 'single_malt' },
  { name: 'japanese_whiskey', category_type: 'single_grain' },
  { name: 'japanese_whiskey', category_type: 'blended' },
  { name: 'japanese_whiskey', category_type: 'blended_malt' },
  { name: 'japanese_whiskey', category_type: 'blended_grain' },
  { name: 'irish_whiskey', category_type: 'single_malt' },
  { name: 'irish_whiskey', category_type: 'single_grain' },
  { name: 'irish_whiskey', category_type: 'blended' },
  { name: 'irish_whiskey', category_type: 'blended_malt' },
  { name: 'irish_whiskey', category_type: 'blended_grain' }
])
