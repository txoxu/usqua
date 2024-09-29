# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create categories by name
# category_names = [
#   'american_whiskey',
#   'scotch_whiskey',
#   'canadian_whiskey',
#   'japanese_whiskey',
#   'irish_whiskey'
# ]
#
# Create categories by category_type
# category_types = [
#   'single_malt',
#   'single_grain',
#   'blended',
#   'blended_malt',
#   'blended_grain'
# ]
#
# category_names.each do |category_name|
#   category_types.each do |category_type|
#     Category.create(category_name: category_name, category_type: category_type)
#   end
# end
#
# puts "Categories seeded successfully."
# remmaining_quantities = [
#  {id: 1, quantity: '0ml', quantity_image: '0ml.jpg'},
#  {id: 2, quantity: '100ml', quantity_image: '100ml.jpg'},
#  {id: 3, quantity: '200ml', quantity_image: '200ml.jpg'},
#  {id: 4, quantity: '300ml', quantity_image: '300ml.jpg'},
#  {id: 5, quantity: '400ml', quantity_image: '400ml.jpg'},
#  {id: 6, quantity: '500ml', quantity_image: '500ml.jpg'},
#  {id: 7, quantity: '600ml', quantity_image: '600ml.jpg'},
#  {id: 8, quantity: '700ml', quantity_image: '700ml.jpg'}
# ]
#
# remmaining_quantities.each do |data|
#  remmaining_quantity = RemmainingQuantity.find_by(id: data[:id])
#  if remmaining_quantity
#    remmaining_quantity.update(data)
#  else
#    RemmainingQuantity.create(data)
#  end
# end
#  cocktails = [
#    { id: 1, base_cocktail_id: 1,
#       cocktail_name: 'アフィニティー',
#       cocktail_origin: '「新和性」、「相性」の意味で、ベースとなる材料の原産国の関係を表しているとされる',
#      cocktail_recipe: 'スコッチウイスキー:1/3, ドライベルモット:1/3, スイートベルモット:1/3, アンゴラスチュラビターズ:2ダッシュ',
#       cocktail_url: 'qZOv9nYS78A?si=LsJU9O6Iyfa3H0Wx' },
#    { id: 2, base_cocktail_id: 1,
#       cocktail_name: 'チャーチル',
#       cocktail_origin: 'イギリス首相サー・ウィンストン・チャーチルにちなんだと思われるカクテル',
#      cocktail_recipe: 'スコッチウイスキー:3/6, コアントロー:1/6, スイートベルモット:1/6, ライムジュース:1/6',
#       cocktail_url: 'ZOUax8VJCz4?si=cwjzGoNZEcyxM8jZ' },
#    { id: 3, base_cocktail_id: 1,
#       cocktail_name: 'エリカ',
#       cocktail_origin: '銀座のバー「絵里香」の中村健二氏オリジナルカクテル',
#      cocktail_recipe: 'スコッチウイスキー:3/6, クレームドカシス:2/6, グレープフルーツジュース:1/6, グレデンシロップ:1ティースプーン, レモンジュース:1ディースプーン',
#       cocktail_url: 'l3dJIzdHFTg?si=HPvMTu-J4sUMPnsl' },
#    { id: 4, base_cocktail_id: 1,
#       cocktail_name: 'ゲーリック・コーヒー',
#      cocktail_origin: 'ゲーリックとは「ゲール人の」という意味で、アイルランド人やスコットランド人の祖先にあたる。アイリッシュウィスキーを用いれば「アイリッシュ・コーヒー」',
#       cocktail_recipe: 'スコッチウイスキー:30ml, コーヒー:適量, コーヒーシュガー:適量, 生クリーム:適量',
#       cocktail_url: '41qWY4PE3vk?si=cTE0_eOPqkIuQeaH' },
#    { id: 5, base_cocktail_id: 1,
#       cocktail_name: 'ロブ・ロイ',
#       cocktail_origin: '実在した義賊ロバート・マクレガーの愛称',
#      cocktail_recipe: 'スコッチウイスキー:3/4, スイートベルモット:1/4, アンゴラスチュラビターズ:1ダッシュ',
#       cocktail_url: 'IWfEarKCDhQ?si=R-RE01LINeKmv5iR' },
#    { id: 6, base_cocktail_id: 1,
#       cocktail_name: 'スコッチ・コリンズ',
#      cocktail_origin: '１９世紀のロンドンで、リマーズクラブのヘッドウエイターであったジョン・コリンズに由来する',
#       cocktail_recipe: 'スコッチウイスキー: 60ml, レモンジュース: 20ml, 砂糖: 2ティースプーン, 炭酸水: 適量',
#       cocktail_url: 'Z6nsGVnbj5g?si=35V6Z_XGi7S0dfb5' },
#    { id: 7, base_cocktail_id: 1,
#       cocktail_name: 'ラスティ・ネイル',
#       cocktail_origin: 'ラスティ・ネイルとは「錆びた釘」という意味',
#      cocktail_recipe: 'スコッチウイスキー: 30ml, ドランブイ: 30ml',
#       cocktail_url: '5YnaJxkbTns?si=GL_oWWmE7NPO2ykz' },
#    { id: 8, base_cocktail_id: 1,
#       cocktail_name: 'スコッチ・キルト',
#       cocktail_origin: 'キルトとは、スコットランドのタータン・チェックのプリーツスカート風民族衣装のこと',
#      cocktail_recipe: 'スコッチウイスキー: 2/3, ドランブイ: 1/3, オレンジビターズ: 2ダッシュ',
#       cocktail_url: '6jrx_ZJGfOo?si=24HGepzuWQEc6ClY' },
#    { id: 9, base_cocktail_id: 1,
#       cocktail_name: 'セント・アンドリュース',
#      cocktail_origin: 'セント・アンドリュースはスコットランドの守護聖人。ゴルフの発祥地の名前でもある',
#       cocktail_recipe: 'スコッチウイスキー: 1/3, ドランブイ: 1/3, オレンジジュース:1/3',
#       cocktail_url: 'Ru-CjyZStcI?si=i-RAfyF3i2uf7W05' },
#    { id: 10, base_cocktail_id: 1,
#       cocktail_name: 'ロッホ・ローモンド',
#       cocktail_origin: 'スコットランド最大の湖の名前。同名でウイスキーとしても存在する',
#      cocktail_recipe: 'スコッチウイスキー: 90ml, アンゴラスチュラビターズ: 3~5ダッシュ, シュガーシロップ: 15ml',
#       cocktail_url: 'LSPUK09-WEM?si=RkjMFjd8U_Md2m8d' },
#    { id: 11, base_cocktail_id: 2,
#       cocktail_name: 'バーボネラ',
#       cocktail_origin: 'イギリスのバーテンダー、w.ホイットフィールド氏が考案した',
#      cocktail_recipe: 'バーボンウイスキー: 30ml, ドライベルモット: 15ml, オレンジキュラソー: 15ml, グレナデンシロップ: 1ダッシュ, 砂糖: 1ティースプーン, 炭酸水: 適量',
#       cocktail_url: '3cLcoWL0fXQ?si=5FZVvupB24Pl1b-H' },
#    { id: 12, base_cocktail_id: 2,
#       cocktail_name: 'カリフォルニア・レモネード',
#      cocktail_recipe: 'バーボンウイスキー: 45ml, レモンジュース: 20ml, ライムジュース: 10ml, グレナデンシロップ: 1ティースプーン, 砂糖: 1ティースプーン, 炭酸水: 適量',
#       cocktail_url: 'raq4eC0ZNe8?si=A-lhryhZZOKwheau' },
#    { id: 13, base_cocktail_id: 2,
#       cocktail_name: 'カウボーイ',
#       cocktail_create: 'シェイクで作成しても大丈夫',
#      cocktail_recipe: 'バーボンウイスキー: 2/3, 生クリーム: 1/3',
#       cocktail_url: 'J3qXTanOOrw?si=oK_MqQuV-OThukw4' },
#    { id: 14, base_cocktail_id: 2,
#       cocktail_name: 'ミント・ジュレップ',
#       cocktail_origin: 'アメリカ南部生まれの古典的なカクテル',
#      cocktail_recipe: 'バーボンウイスキー: 50ml, 砂糖: 2ティースプーン, 水または炭酸水: 30ml, ミントの葉: 4枚',
#       cocktail_url: '20wcXR1HFyg?si=EMnbNHeGCXQj8Pjg' },
#    { id: 15, base_cocktail_id: 3,
#       cocktail_name: 'ブルックリン', cocktail_origin: 'ブルックリンはマンハッタン島の南東、イーストリバーを挟んだ対岸の地域名',
#      cocktail_recipe: 'ライウイスキー: 2/3, ドライベルモット: 1/3, アメール・ピコン: 1ダッシュ, マラスキーノ: 1ダッシュ',
#       cocktail_url: 'CPb5yqo_e3s?si=lk1j3qwKaDZmX698' },
#    { id: 16, base_cocktail_id: 3,
#       cocktail_name: 'ハンター', cocktail_recipe: 'ライウイスキー: 3/4, チェリーブランデー: 1/4',
#      cocktail_url: 'OTWVeMwQNzs?si=sLAQwaO8ge92zqrR' },
#    { id: 17, base_cocktail_id: 3,
#       cocktail_name: 'インク・ストリート',
#      cocktail_recipe: 'ライウイスキー: 2/4, オレンジジュース: 1/4, レモンジュース: 1/4',
#       cocktail_url: 'n0JgbzQPjgY?si=zWGmycRRAvS9SK9w' },
#    { id: 18, base_cocktail_id: 3,
#       cocktail_name: 'マンハッタン',
#      cocktail_origin: '「カクテルの女王」と言われ、ニューヨークのマンハッタンクラブで作られたと伝えられている。ドライベルモットを使用すると「ドライ・マンハッタン」、スイートベルモットとドライベルモット両方を使用すると「パーフェクト・マンハッタン」と複数のレシピがある',
#       cocktail_recipe: 'ライウイスキー: 3/4, スイートベルモット: 1/4, アンゴラスチュラビターズ: 1ダッシュ', cocktail_url: 'DfTKOU1BzZ0?si=LDB0RFs9pcqfvjMB' },
#    { id: 19, base_cocktail_id: 3,
#       cocktail_name: 'オールドファッションド',
#      cocktail_recipe: 'ライウイスキー(又はバーボンウイスキー): 45ml, アンゴラスチュラビターズ: 2ダッシュ, 角砂糖: 1個',
#       cocktail_url: 'vAgZqMssKnE?si=Eqq64-nO968B78dV' },
#    { id: 20, base_cocktail_id: 3,
#       cocktail_name: 'オールド・パル',
#       cocktail_recipe: 'ライウイスキー: 1/3, ドライベルモット: 1/3, カンパリ: 1/3',
#      cocktail_url: 'wRK7tGQs-w4?si=yNqacn6z3Nn6KX6v' },
#    { id: 21, base_cocktail_id: 3,
#       cocktail_name: 'ワード・エイト',
#       cocktail_origin: 'アメリカ合衆国の都市ボストンを8つの区に分けた時に作られたとされている',
#      cocktail_recipe: 'ライウイスキー: 2/4, レモンジュース: 1/4, オレンジジュース: 1/4, グレナデンシロップ: 2ダッシュ',
#       cocktail_url: 'Y-Jw28jasJs?si=ZNHGayte7bQTIzgk' },
#    { id: 22, base_cocktail_id: 4,
#       cocktail_name: 'ブラックソーン', cocktail_origin: 'バラ科の常緑樹',
#      cocktail_recipe: 'アイリッシュウィスキー: 1/2, ドライベルモット: 1/2, ペルノー: 3ダッシュ, アンゴラスチュラビターズ: 3ダッシュ',
#       cocktail_url: 'sR90FHpvnMg?si=2d1gXk8P9U8F9C-w' },
#    { id: 23, base_cocktail_id: 4,
#       cocktail_name: 'アイリッシュ・コーヒー',
#      cocktail_origin: 'スコッチを使用すれば「ゲーリック・コーヒー」、ブランデーを使用すれば「カフェ・ロワイヤル」',
#       cocktail_recipe: 'アイリッシュウィスキー: 30ml, 砂糖(又はコーヒーシュガー): 1ティースプーン, コーヒー: 適量, 生クリーム: 適量', cocktail_url: '9sz5L1WKhvE?si=kEh01fO57-sBJogv' },
#    { id: 24, base_cocktail_id: 5,
#       cocktail_name: 'ブラッド＆サンド',
#      cocktail_recipe: 'ウイスキー: 1/4, チェリーブランデー: 1/4, スイートベルモット: 1/4, オレンジジュース: 1/4',
#       cocktail_url: 'b3hdT_AmZ-w?si=la8EPd0fLPbGBXES' },
#    { id: 25, base_cocktail_id: 5,
#       cocktail_name: 'ゴッドファーザー',
#       cocktail_recipe: 'ウイスキー: 45ml, アマレット: 15ml',
#      cocktail_url: 'vIMjIJ3uZ9Y?si=Q5YXUY1AUk1ENnb9' },
#    { id: 26, base_cocktail_id: 5,
#       cocktail_name: 'ホール・イン・ワン',
#      cocktail_recipe: 'ウイスキー: 2/3, ドライベルモット: 1/3, レモンジュース: 1ダッシュ, オレンジジュース: 1ダッシュ',
#       cocktail_url: 'jPax-7GTYj0?si=_Q-SCXgENJLotNS5' },
#    { id: 27, base_cocktail_id: 5,
#       cocktail_name: 'ハリケーン',
#      cocktail_recipe: 'ウイスキー: 1/4, ドライジン: 1/4, ペパーミント: 1/4, レモンジュース: 1/4',
#       cocktail_url: '0aIm43WX-8Q?si=RM_aoT2bkhMQDYR_' },
#    { id: 28, base_cocktail_id: 5,
#       cocktail_name: 'インペリアル・フィズ',
#      cocktail_recipe: 'ウイスキー: 45ml, ラム: 15ml, レモンジュース: 20ml, 砂糖: 2ティースプーン, 炭酸水: 適量',
#       cocktail_url: 'ClMrIGN3cvE?si=btbD2bB4JjSyPod3' },
#    { id: 29, base_cocktail_id: 5,
#       cocktail_name: 'ジョン・コリンズ',
#      cocktail_recipe: 'ウイスキー: 60ml, レモンジュース: 20ml, 砂糖: 2ティースプーン, 炭酸水: 適量',
#       cocktail_url: 'vUwiKcDnI70?si=2GabT2Y4jBrTYV1S' },
#    { id: 30, base_cocktail_id: 5,
#       cocktail_name: 'クロンダイク・クーラー',
#      cocktail_recipe: 'ウイスキー: 45ml, オレンジジュース: 20ml, ジンジャエール: 適量',
#       cocktail_url: 'VXweWkfPYFw?si=sE4lqbHl27meCvOI' },
#    { id: 31, base_cocktail_id: 5,
#       cocktail_name: 'ミント・クーラー',
#       cocktail_recipe: 'ウイスキー: 45ml, クレームドミント: 3ダッシュ, 炭酸水: 適量',
#      cocktail_url: 'GPXImAjKzJ0?si=NKU2Cx0ZweFzblXc' }
#  ]
#
#  cocktails.each do |cocktail_data|
#    cocktail = Cocktail.find_by(id: cocktail_data[:id])
#    if cocktail
#      cocktail.update(cocktail_data)
#    else
#      Cocktail.create(cocktail_data)
#    end
#  end
# cocktails.each do |cocktail|
#   Cocktail.create!(cocktail)
#   Rails.logger.info "Created cocktail: #{cocktail[:cocktail_name]}"
# rescue StandardError => e
#   Rails.logger.error "Failed to create cocktail: #{cocktail[:cocktail_name]}, Error: #{e.message}"
# end
#  base_cocktails = [
#    {id: 1, base_name: 'スコッチウイスキーベース'},
#    {id: 2, base_name: 'バーボンウイスキーベース'},
#    {id: 3, base_name: 'ライウイスキーベース'},
#    {id: 4, base_name: 'アイリッシュウィスキーベース'},
#    {id: 5, base_name: 'ブレンデットウイスキーベース'}
#  ]
#
#  base_cocktails.each do |b|
#    begin
#      BaseCocktail.create!(b)
#      Rails.logger.info "Created base_cocktail: #{b[:base_name]}"
#    rescue StandardError => e
#      Rails.logger.error "Failed to create base_cocktail: #{b[:base_name]}, Error: #{e.message}"
#    end
#  end

whiskey_badges = [
  { id: 1, name: '初登録', description: '初めてウイスキーを登録しました。', conditions: { 'type' => 'new_whiskey_count', 'count' => 1 } }
]

whiskey_badges.each do |b|
  WhiskeyBadge.find_or_create_by!(id: b[:id]) do |badge|
    badge.name = b[:name]
    badge.description = b[:description]
    badge.conditions = b[:conditions]
  end
  Rails.logger.info "ウイスキーバッジを作成しました。: #{b[:name]}"
rescue StandardError => e
  Rails.logger.error "ウイスキーバッジの作成に失敗しました。: #{b[:name]}, Error: #{e.message}"
end
