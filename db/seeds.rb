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
  '0ml-a254db60c9aa72434814e9358220986148a6ba02431d065b9a7229d07cc2576b.jpg',
  '100ml-85bf600123d794fc90e916d3275bf36f3930c5a624b83f6d6323a6956965311d.jpg',
  '200ml-60b110b7cc6a0164de1821f3905805f5f52725a119106913b914dd503db87032.jpg',
  '300ml-1265037e13926b3cd989e6e3ce0fd56be40910c9abcd34c6e87ab05f751bbf15.jpg',
  '400ml-ab63d5693ed76f651e2905d2e6ccc13c59db195c968f5f60a10bb0dd1dfc74ce.jpg',
  '500ml-aa6f227f709c891ffa0726ee076254e372ba279cf51b599f5b2ccdb932027d75.jpg',
  '600ml-6d879b7114d8638dc7cf6b7cdd73b8cd074dde37503a60456c2502b38a20809d.jpg',
  '700ml-5c61fc17665d8183cb6360d6a357bf880eb03c27b8a5e520e101a2aa02931df2.jpg'
]


  quantity_images.each do |image|
  # 正規表現で数量部分を抽出
  quantity_match = image.match(/(\d+ml)/)
  if quantity_match
    quantity = quantity_match[1] # キャプチャグループから数量を取得
    remaining_quantity = RemmainingQuantity.find_by(quantity: quantity)

    if remaining_quantity
      # 画像の名前だけを保存
      remaining_quantity.quantity_image = image
      
      if remaining_quantity.save
        puts "Image #{image} attached to quantity #{quantity} successfully."
      else
        puts "Failed to attach image #{image} to quantity #{quantity}."
      end
    else
      puts "No record found for quantity #{quantity}"
    end
  else
    puts "No quantity found in image filename #{image}"
  end
end
