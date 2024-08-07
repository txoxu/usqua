# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create categories by name
=begin
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
=end


cocktails = [
  {id: 1, cocktail_name: 'アバディーン・アンガス', cocktail_create: 'ドランブイ以外の材料をグラスに注ぐ。ドランブイは温めて火をつけ、発火している状態で注ぐ。', cocktail_origin: 'スコットランド原産の黒毛の牛の正式名称', cocktail_recipe: 'スコッチウイスキー:60ml, 蜂蜜:15ml, ライムジュース:30ml, ドランブイ:30ml', cocktail_url: ''},
  {id: 2, cocktail_name: 'アフィニティー', cocktail_create: 'すべての材料を混ぜる。ステアして、カクテルグラスに注ぐ。', cocktail_origin: '「新和性」、「相性」の意味で、ベースとなる材料の原産国の関係を表しているとされる', cocktail_recipe: 'スコッチウイスキー:1/3, ドライベルモット:1/3, スイートベルモット:1/3, アンゴラスチュラビターズ:2ダッシュ', cocktail_url: 'qZOv9nYS78A?si=LsJU9O6Iyfa3H0Wx'},
  {id: 3, cocktail_name: 'アソール・ブロス', cocktail_create: '十分に温めたロックグラスに材料を注ぎ、混ぜる。', cocktail_origin: 'スコッチウイスキーをベースに香草類を配合したリキュールが同名で存在する。', cocktail_recipe: 'スコッチウイスキー:30ml, 蜂蜜:30ml, 生クリーム:30ml', cocktail_url: ''},
  {id: 4, cocktail_name: 'ボニー・スコット', cocktail_create: 'シェイクして、カクテルグラスに注ぐ', cocktail_origin: '「ボニー」はスコットランド語で「可愛らしい」という意味。', cocktail_recipe: 'スコッチウイスキー:1/2, ドランブイ:1/4, レモンジュース:1/4', cocktail_url: ''},
  {id: 5, cocktail_name: 'フライング・スコッチマン', cocktail_create: 'シェイクして、カクテルグラスに注ぐ', cocktail_origin: 'ロンドンとエジンバラ間で運行されている特急列車の名称', cocktail_recipe: 'スコッチウイスキー:2/3, スイートベルモット:1/3, ビターズ:1ダッシュ, シュガーシロップ:1ダッシュ', cocktail_url: ''},
  {id: 6, cocktail_name: 'チャーチル', cocktail_create: 'シェイクしてカクテルグラスに注ぐ', cocktail_origin: 'イギリス首相サー・ウィンストン・チャーチルにちなんだと思われるカクテル', cocktail_recipe: 'スコッチウイスキー:3/6, コアントロー:1/6, スイートベルモット:1/6, ライムジュース:1/6', cocktail_url: 'youtu.be/bIJJtaan7K0?si=wHM2zGtb8vB2zfJL'},
  {id: 7, cocktail_name: 'エリカ', cocktail_create: 'シェイクしてカクテルグラスに注ぐ。ミントチェリーとカスミソウを飾る', cocktail_origin: '銀座のバー「絵里香」の中村健二氏オリジナルカクテル', cocktail_recipe: 'スコッチウイスキー:3/6, クレームドカシス:2/6, グレープフルーツジュース:1/6, グレデンシロップ:1ティースプーン, レモンジュース:1ディースプーン', cocktail_url: 'l3dJIzdHFTg?si=HPvMTu-J4sUMPnsl'},
  {id: 8, cocktail_name: 'ハイランドクリーム', cocktail_create: 'シェイカーに2/3氷を入れ、材料を入れてシェイクしてカクテルグラスに注ぐ。チョコレートパウダー少々を飾る', cocktail_origin: 'ホテル・リッツ・パリのバーテンダー、コリー・ピーター・フィールド氏の考案カクテル', cocktail_recipe: 'グランツ（スコッチウイスキー）:1/10, コーヒーリキュール:2/10, クレーム・ド・カカオ・ブリュン（ダーク）:2/10, エスプレッソ（ブラック）:1/10, 生クリーム:4/10', cocktail_url: ''},
  {id: 9, cocktail_name: 'オールド・アライアンス', cocktail_create: 'シェイクして、グラス注ぐ。レモネードを浮かべるとなおよい', cocktail_origin: 'カクテル名は「昔の仲間」「同盟関係」', cocktail_recipe: 'スコッチウイスキー:25ml, レモンジュース:1/2個, コアントロー:15ml, シュガーシロップ:適量, レモネード:適量', cocktail_url: ''},
  {id: 10, cocktail_name: 'ゲーリック・コーヒー', cocktail_create: 'コーヒーカップに適量のコーヒーシュガーとコーヒーを７分目注ぐ。ウイスキーを加え混ぜ、生クリームをフローとする', cocktail_origin: 'ゲーリックとは「ゲール人の」という意味で、アイルランド人やスコットランド人の祖先にあたる。アイリッシュウィスキーを用いれば「アイリッシュ・コーヒー」', cocktail_recipe: 'スコッチウイスキー:30ml, コーヒー:適量, コーヒーシュガー:適量, 生クリーム:適量', cocktail_url: '41qWY4PE3vk?si=cTE0_eOPqkIuQeaH'},
  {id: 11, cocktail_name: 'ロブ・ロイ', cocktail_create: 'すべての材料をステアし、カクテルグラスに注ぐ。カクテルピンを刺したマラスキーのチェリーを添え、レモンピールを絞る', cocktail_origin: '実在した義賊ロバート・マクレガーの愛称', cocktail_recipe: 'スコッチウイスキー:3/4, スイートベルモット:1/4, アンゴラスチュラビターズ:1ダッシュ', cocktail_url: 'IWfEarKCDhQ?si=R-RE01LINeKmv5iR'},
  {id: 12, cocktail_name: 'スコッチ・コリンズ', cocktail_create: 'シェイクして、氷を入れたグラスに炭酸水を注ぐ', cocktail_origin: '１９世紀のロンドンで、リマーズクラブのヘッドウエイターであったジョン・コリンズに由来する', cocktail_recipe: 'スコッチウイスキー: 60ml, レモンジュース: 20ml, 砂糖: 2ティースプーン, 炭酸水: 適量', cocktail_url: 'watch?v=Z6nsGVnbj5g?si=wkOH1KTh0aZacRm3'},
  {id: 13, cocktail_name: 'ラスティ・ネイル', cocktail_create: '氷を入れたグラスに注ぎ、ステアする', cocktail_origin: 'ラスティ・ネイルとは「錆びた釘」という意味', cocktail_recipe: 'スコッチウイスキー: 30ml, ドランブイ: 30ml', cocktail_url: 'watch?v=5YnaJxkbTns?si=cEZHVliQWmIn_8D9'},
  {id: 14, cocktail_name: 'スポーラン', cocktail_create: 'シェイクして、カクテルグラスに注ぐ。ミントチェリーを飾る', cocktail_origin: 'スポーランはキルト着用時に、身に着ける小型のバッグのこと', cocktail_recipe: 'スコッチウイスキー: 1/4, アリーゼ: 1/4, クレームドピーチ: 1/4, ミントリキュール: 1/4, レモンジュース: 1ティースプーン', cocktail_url: ''},
  {id: 15, cocktail_name: 'スコッチ・キルト', cocktail_create: 'すべての材料をステアして、カクテルグラスに注ぐ。レモンピールを絞りかける。', cocktail_origin: 'キルトとは、スコットランドのタータン・チェックのプリーツスカート風民族衣装のこと', cocktail_recipe: 'スコッチウイスキー: 2/3, ドランブイ: 1/3, オレンジビターズ: 2ダッシュ', cocktail_url: '6jrx_ZJGfOo?si=24HGepzuWQEc6ClY'},
  {id: 16, cocktail_name: 'セント・アンドリュース', cocktail_create: 'シェイクして、カクテルグラスに注ぐ。', cocktail_origin: 'セント・アンドリュースはスコットランドの守護聖人。ゴルフの発祥地の名前でもある', cocktail_recipe: 'スコッチウイスキー: 1/3, ドランブイ: 1/3, オレンジジュース:1/3', cocktail_url: 'Ru-CjyZStcI?si=i-RAfyF3i2uf7W05'},
  {id: 17, cocktail_name: 'ローヤル・アンバサダー', cocktail_create: 'すべての材料をステアして、カクテルグラスに注ぐ。ミントチェリー、マラスキーのチェリーを添える', cocktail_origin: '中村健二氏オリジナルカクテル', cocktail_recipe: 'スコッチウイスキー: 4/6, ドランブイ: 2/6, レモンジュース: 1ティースプーン', cocktail_url: ''},
  {id: 18, cocktail_name: 'ロッホ・ローモンド', cocktail_create: 'シェイクして、カクテルグラスに注ぐ。', cocktail_origin: 'スコットランド最大の湖の名前。同名でウイスキーとしても存在する', cocktail_recipe: 'スコッチウイスキー: 90ml, アンゴラスチュラビターズ: 3~5ダッシュ, シュガーシロップ: 15ml', cocktail_url: 'LSPUK09-WEM?si=RkjMFjd8U_Md2m8d'}
]


  cocktails.each do |cocktail|
    Cocktail.create(cocktail)
  end
