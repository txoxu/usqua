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
quantities = [
  '0ml',
  '100ml',
  '200ml',
  '300ml',
  '400ml',
  '500ml',
  '600ml',
  '700ml'
]

quantities.each do |quantity|
  RemmainingQuantity.create(quantity: quantity)
end

puts "Remaining quantities seeded successfully."

quantity_images = [
  '0ml.jpg',
  '100ml.jpg',
  '200ml.jpg',
  '300ml.jpg',
  '400ml.jpg',
  '500ml.jpg',
  '600ml.jpg',
  '700ml.jpg'
]


  quantity_images.each do |image|
    quantity = image.gsub('.jpg', '') # '0ml.jpg' -> '0ml'
    remaining_quantity = RemmainingQuantity.find_by(quantity: quantity)
    
    unless remaining_quantity.nil?
      # 画像の名前だけを保存
      remaining_quantity.update(quantity_image: image)
      
      if remaining_quantity.save
        puts "Image #{image} attached to quantity #{quantity} successfully."
      else
        puts "Failed to attach image #{image} to quantity #{quantity}."
      end
    else
      puts "No record found for quantity #{quantity}"
    end
  end
  
  puts "Remaining quantities images seeded successfully."
