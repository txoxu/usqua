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
# cocktails = [
#   { id: 1, base_cocktail_id: 1,
#     cocktail_name: 'アフィニティー',
#     cocktail_origin: '「新和性」、「相性」の意味で、ベースとなる材料の原産国の関係を表しているとされる',
#     cocktail_recipe: 'スコッチウイスキー:1/3, ドライベルモット:1/3, スイートベルモット:1/3,
#                        アンゴラスチュラビターズ:2ダッシュ',
#     cocktail_url: 'qZOv9nYS78A?si=LsJU9O6Iyfa3H0Wx',
#     cocktail_image: 'アフィニティー.webp' },
#   { id: 2, base_cocktail_id: 1,
#     cocktail_name: 'チャーチル',
#     cocktail_origin: 'イギリス首相サー・ウィンストン・チャーチルにちなんだと思われるカクテル',
#     cocktail_recipe: 'スコッチウイスキー:3/6, コアントロー:1/6, スイートベルモット:1/6, ライムジュース:1/6',
#     cocktail_url: 'ZOUax8VJCz4?si=cwjzGoNZEcyxM8jZ',
#     cocktail_image: 'チャーチル.webp' },
#   { id: 3, base_cocktail_id: 1,
#     cocktail_name: 'エリカ',
#     cocktail_origin: '銀座のバー「絵里香」の中村健二氏オリジナルカクテル',
#     cocktail_recipe: 'スコッチウイスキー:3/6, クレームドカシス:2/6, グレープフルーツジュース:1/6,
#                        グレデンシロップ:1ティースプーン, レモンジュース:1ディースプーン',
#     cocktail_url: 'l3dJIzdHFTg?si=HPvMTu-J4sUMPnsl',
#     cocktail_image: 'エリカ.webp' },
#   { id: 4, base_cocktail_id: 1,
#     cocktail_name: 'ゲーリック・コーヒー',
#     cocktail_origin: 'ゲーリックとは「ゲール人の」という意味で、アイルランド人やスコットランド人の祖先にあたる。
#                        アイリッシュウィスキーを用いれば「アイリッシュ・コーヒー」',
#     cocktail_recipe: 'スコッチウイスキー:30ml, コーヒー:適量, コーヒーシュガー:適量, 生クリーム:適量',
#     cocktail_url: '41qWY4PE3vk?si=cTE0_eOPqkIuQeaH',
#     cocktail_image: 'ゲーリック・コーヒー.webp' },
#   { id: 5, base_cocktail_id: 1,
#     cocktail_name: 'ロブ・ロイ',
#     cocktail_origin: '実在した義賊ロバート・マクレガーの愛称',
#     cocktail_recipe: 'スコッチウイスキー:3/4, スイートベルモット:1/4, アンゴラスチュラビターズ:1ダッシュ',
#     cocktail_url: 'IWfEarKCDhQ?si=R-RE01LINeKmv5iR',
#     cocktail_image: 'ロブ・ロイ.webp' },
#   { id: 6, base_cocktail_id: 1,
#     cocktail_name: 'スコッチ・コリンズ',
#     cocktail_origin: '１９世紀のロンドンで、リマーズクラブのヘッドウエイターであったジョン・コリンズに由来する',
#     cocktail_recipe: 'スコッチウイスキー: 60ml, レモンジュース: 20ml, 砂糖: 2ティースプーン, 炭酸水: 適量',
#     cocktail_url: 'Z6nsGVnbj5g?si=35V6Z_XGi7S0dfb5',
#     cocktail_image: 'スコッチ・コリンズ.webp' },
#   { id: 7, base_cocktail_id: 1,
#     cocktail_name: 'ラスティ・ネイル',
#     cocktail_origin: 'ラスティ・ネイルとは「錆びた釘」という意味',
#     cocktail_recipe: 'スコッチウイスキー: 30ml, ドランブイ: 30ml',
#     cocktail_url: '5YnaJxkbTns?si=GL_oWWmE7NPO2ykz',
#     cocktail_image: 'ラスティ・ネイル.webp' },
#   { id: 8, base_cocktail_id: 1,
#     cocktail_name: 'スコッチ・キルト',
#     cocktail_origin: 'キルトとは、スコットランドのタータン・チェックのプリーツスカート風民族衣装のこと',
#     cocktail_recipe: 'スコッチウイスキー: 2/3, ドランブイ: 1/3, オレンジビターズ: 2ダッシュ',
#     cocktail_url: '6jrx_ZJGfOo?si=24HGepzuWQEc6ClY',
#     cocktail_image: 'スコッチ・キルト.webp' },
#   { id: 9, base_cocktail_id: 1,
#     cocktail_name: 'セント・アンドリュース',
#     cocktail_origin: 'セント・アンドリュースはスコットランドの守護聖人。ゴルフの発祥地の名前でもある',
#     cocktail_recipe: 'スコッチウイスキー: 1/3, ドランブイ: 1/3, オレンジジュース:1/3',
#     cocktail_url: 'Ru-CjyZStcI?si=i-RAfyF3i2uf7W05',
#     cocktail_image: 'セント・アンドリュース.webp' },
#   { id: 10, base_cocktail_id: 1,
#     cocktail_name: 'ロッホ・ローモンド',
#     cocktail_origin: 'スコットランド最大の湖の名前。同名でウイスキーとしても存在する',
#     cocktail_recipe: 'スコッチウイスキー: 90ml, アンゴラスチュラビターズ: 3~5ダッシュ, シュガーシロップ: 15ml',
#     cocktail_url: 'LSPUK09-WEM?si=RkjMFjd8U_Md2m8d',
#     cocktail_image: 'ロッホ・ローモンド.webp' },
#   { id: 11, base_cocktail_id: 2,
#     cocktail_name: 'バーボネラ',
#     cocktail_origin: 'イギリスのバーテンダー、w.ホイットフィールド氏が考案した',
#     cocktail_recipe: 'バーボンウイスキー: 30ml, ドライベルモット: 15ml, オレンジキュラソー: 15ml,
#                        グレナデンシロップ: 1ダッシュ, 砂糖: 1ティースプーン, 炭酸水: 適量',
#     cocktail_url: '3cLcoWL0fXQ?si=5FZVvupB24Pl1b-H',
#     cocktail_image: 'バーボネラ.webp' },
#   { id: 12, base_cocktail_id: 2,
#     cocktail_name: 'カリフォルニア・レモネード',
#     cocktail_recipe: 'バーボンウイスキー: 45ml, レモンジュース: 20ml, ライムジュース: 10ml,
#                        グレナデンシロップ: 1ティースプーン, 砂糖: 1ティースプーン, 炭酸水: 適量',
#     cocktail_url: 'raq4eC0ZNe8?si=A-lhryhZZOKwheau',
#     cocktail_image: 'カリフォルニア・レモネード.webp' },
#   { id: 13, base_cocktail_id: 2,
#     cocktail_name: 'カウボーイ',
#     cocktail_create: 'シェイクで作成しても大丈夫',
#     cocktail_recipe: 'バーボンウイスキー: 2/3, 生クリーム: 1/3',
#     cocktail_url: 'J3qXTanOOrw?si=oK_MqQuV-OThukw4',
#     cocktail_image: 'カウボーイ.webp' },
#   { id: 14, base_cocktail_id: 2,
#     cocktail_name: 'ミント・ジュレップ',
#     cocktail_origin: 'アメリカ南部生まれの古典的なカクテル',
#     cocktail_recipe: 'バーボンウイスキー: 50ml, 砂糖: 2ティースプーン, 水または炭酸水: 30ml, ミントの葉: 4枚',
#     cocktail_url: '20wcXR1HFyg?si=EMnbNHeGCXQj8Pjg',
#     cocktail_image: 'ミント・ジュレップ.webp' },
#   { id: 15, base_cocktail_id: 3,
#     cocktail_name: 'ブルックリン', cocktail_origin: 'ブルックリンはマンハッタン島の南東、イーストリバーを挟んだ対岸の地域名',
#     cocktail_recipe: 'ライウイスキー: 2/3, ドライベルモット: 1/3, アメール・ピコン: 1ダッシュ, マラスキーノ: 1ダッシュ',
#     cocktail_url: 'CPb5yqo_e3s?si=lk1j3qwKaDZmX698',
#     cocktail_image: 'ブルックリン.webp' },
#   { id: 16, base_cocktail_id: 3,
#     cocktail_name: 'ハンター', cocktail_recipe: 'ライウイスキー: 3/4, チェリーブランデー: 1/4',
#     cocktail_url: 'OTWVeMwQNzs?si=sLAQwaO8ge92zqrR',
#     cocktail_image: 'ハンター.webp' },
#   { id: 17, base_cocktail_id: 3,
#     cocktail_name: 'インク・ストリート',
#     cocktail_recipe: 'ライウイスキー: 2/4, オレンジジュース: 1/4, レモンジュース: 1/4',
#     cocktail_url: 'n0JgbzQPjgY?si=zWGmycRRAvS9SK9w' },
#   { id: 18, base_cocktail_id: 3,
#     cocktail_name: 'マンハッタン',
#     cocktail_origin: '「カクテルの女王」と言われ、ニューヨークのマンハッタンクラブで作られたと伝えられている。
#                          ドライベルモットを使用すると「ドライ・マンハッタン」、
#                          スイートベルモットとドライベルモット両方を使用すると「パーフェクト・マンハッタン」と複数のレシピがある',
#     cocktail_recipe: 'ライウイスキー: 3/4, スイートベルモット: 1/4, アンゴラスチュラビターズ: 1ダッシュ',
#     cocktail_url: 'DfTKOU1BzZ0?si=LDB0RFs9pcqfvjMB' },
#   { id: 19, base_cocktail_id: 3,
#     cocktail_name: 'オールドファッションド',
#     cocktail_recipe: 'ライウイスキー(又はバーボンウイスキー): 45ml, アンゴラスチュラビターズ: 2ダッシュ, 角砂糖: 1個',
#     cocktail_url: 'vAgZqMssKnE?si=Eqq64-nO968B78dV' },
#   { id: 20, base_cocktail_id: 3,
#     cocktail_name: 'オールド・パル',
#     cocktail_recipe: 'ライウイスキー: 1/3, ドライベルモット: 1/3, カンパリ: 1/3',
#     cocktail_url: 'wRK7tGQs-w4?si=yNqacn6z3Nn6KX6v' },
#   { id: 21, base_cocktail_id: 3,
#     cocktail_name: 'ワード・エイト',
#     cocktail_origin: 'アメリカ合衆国の都市ボストンを8つの区に分けた時に作られたとされている',
#     cocktail_recipe: 'ライウイスキー: 2/4, レモンジュース: 1/4, オレンジジュース: 1/4, グレナデンシロップ: 2ダッシュ',
#     cocktail_url: 'Y-Jw28jasJs?si=ZNHGayte7bQTIzgk' },
#   { id: 22, base_cocktail_id: 4,
#     cocktail_name: 'ブラックソーン', cocktail_origin: 'バラ科の常緑樹',
#     cocktail_recipe: 'アイリッシュウィスキー: 1/2, ドライベルモット: 1/2, ペルノー: 3ダッシュ, アンゴラスチュラビターズ: 3ダッシュ',
#     cocktail_url: 'sR90FHpvnMg?si=2d1gXk8P9U8F9C-w' },
#   { id: 23, base_cocktail_id: 4,
#     cocktail_name: 'アイリッシュ・コーヒー',
#     cocktail_origin: 'スコッチを使用すれば「ゲーリック・コーヒー」、ブランデーを使用すれば「カフェ・ロワイヤル」',
#     cocktail_recipe: 'アイリッシュウィスキー: 30ml, 砂糖(又はコーヒーシュガー): 1ティースプーン, コーヒー: 適量, 生クリーム: 適量',
#     cocktail_url: '9sz5L1WKhvE?si=kEh01fO57-sBJogv' },
#   { id: 24, base_cocktail_id: 5,
#     cocktail_name: 'ブラッド＆サンド',
#     cocktail_recipe: 'ウイスキー: 1/4, チェリーブランデー: 1/4, スイートベルモット: 1/4, オレンジジュース: 1/4',
#     cocktail_url: 'b3hdT_AmZ-w?si=la8EPd0fLPbGBXES' },
#   { id: 25, base_cocktail_id: 5,
#     cocktail_name: 'ゴッドファーザー',
#     cocktail_recipe: 'ウイスキー: 45ml, アマレット: 15ml',
#     cocktail_url: 'vIMjIJ3uZ9Y?si=Q5YXUY1AUk1ENnb9' },
#   { id: 26, base_cocktail_id: 5,
#     cocktail_name: 'ホール・イン・ワン',
#     cocktail_recipe: 'ウイスキー: 2/3, ドライベルモット: 1/3, レモンジュース: 1ダッシュ, オレンジジュース: 1ダッシュ',
#     cocktail_url: 'jPax-7GTYj0?si=_Q-SCXgENJLotNS5' },
#   { id: 27, base_cocktail_id: 5,
#     cocktail_name: 'ハリケーン',
#     cocktail_recipe: 'ウイスキー: 1/4, ドライジン: 1/4, ペパーミント: 1/4, レモンジュース: 1/4',
#     cocktail_url: '0aIm43WX-8Q?si=RM_aoT2bkhMQDYR_' },
#   { id: 28, base_cocktail_id: 5,
#     cocktail_name: 'インペリアル・フィズ',
#     cocktail_recipe: 'ウイスキー: 45ml, ラム: 15ml, レモンジュース: 20ml, 砂糖: 2ティースプーン, 炭酸水: 適量',
#     cocktail_url: 'ClMrIGN3cvE?si=btbD2bB4JjSyPod3' },
#   { id: 29, base_cocktail_id: 5,
#     cocktail_name: 'ジョン・コリンズ',
#     cocktail_recipe: 'ウイスキー: 60ml, レモンジュース: 20ml, 砂糖: 2ティースプーン, 炭酸水: 適量',
#     cocktail_url: 'vUwiKcDnI70?si=2GabT2Y4jBrTYV1S' },
#   { id: 30, base_cocktail_id: 5,
#     cocktail_name: 'クロンダイク・クーラー',
#     cocktail_recipe: 'ウイスキー: 45ml, オレンジジュース: 20ml, ジンジャエール: 適量',
#     cocktail_url: 'VXweWkfPYFw?si=sE4lqbHl27meCvOI' },
#   { id: 31, base_cocktail_id: 5,
#     cocktail_name: 'ミント・クーラー',
#     cocktail_recipe: 'ウイスキー: 45ml, クレームドミント: 3ダッシュ, 炭酸水: 適量',
#     cocktail_url: 'GPXImAjKzJ0?si=NKU2Cx0ZweFzblXc' }
# ]
#
# cocktails.each do |cocktail_data|
#   cocktail = Cocktail.find_by(id: cocktail_data[:id])
#   if cocktail
#     # 既存のカクテルを更新
#     cocktail.update(cocktail_data)
#     Rails.logger.info "Updated cocktail: #{cocktail[:cocktail_name]}"
#   else
#     # 新しいカクテルを作成
#     cocktail = Cocktail.create!(cocktail_data)
#     Rails.logger.info "Created cocktail: #{cocktail[:cocktail_name]}"
#   end
# rescue StandardError => e
#   Rails.logger.error "Failed to process cocktail: #{cocktail_data[:cocktail_name]}, Error: #{e.message}"
# end
#
# base_cocktails = [
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
#
# whiskey_badges = [
#   { id: 1, name: 'ウイスキー初心者', description: '初めてウイスキーを登録しました。',
#     conditions: { 'type' => 'new_whiskey_count', 'count' => 1 },
#     badge_image: 'badge(w1).jpg' },
#   { id: 2, name: 'ウイスキーにこだわり始めました', description: '10本ウイスキーを登録しました',
#     conditions: { 'type' => 'ten_whiskey_count', 'count' => 10 },
#     badge_image: 'badge(w10).jpg' },
#   { id: 3, name: 'ウイスキーはそこそこ知ってる', description: '20本ウイスキーを登録しました。',
#     conditions: { 'type' => 'twenty_whiskey_count', 'count' => 20 },
#     badge_image: 'badge(w20).jpg' },
#   { id: 4, name: '現在ウイスキーにとりつかれ中', description: '50本ウイスキーを登録しました。',
#     conditions: { 'type' => 'fifty_whiskey_count', 'count' => 50 },
#     badge_image: 'badge(w50).jpg' },
#   { id: 5, name: 'もう何も言うことはございません', description: '100本ウイスキーを登録しました。',
#     conditions: { 'type' => 'one_hundred_whiskey_count', 'count' => 100 },
#     badge_image: 'badge(w100).jpg' },
#   { id: 6, name: 'まだ、味に違いが分かりません', description: '初めてテイスティング登録しました。',
#     conditions: { 'type' => 'new_tasting_count', 'count' => 1 },
#     badge_image: 'badge(tt1).jpg' },
#   { id: 7, name: 'まぁまぁの種類飲んでる', description: '10回テイスティング登録しました。',
#     conditions: { 'type' => 'ten_tasting_count', 'count' => 10 },
#     badge_image: 'badge(tt10).jpg' },
#   { id: 8, name: '味の違いに気づいてきちゃった', description: '20回テイスティング登録しました。',
#     conditions: { 'type' => 'twenty_tasting_count', 'count' => 20 },
#     badge_image: 'badge(tt20).jpg' },
#   { id: 9, name: 'テイスティング専用のグラス買っちゃいなよぉ～', description: '50回テイスティング登録しました。',
#     conditions: { 'type' => 'fifty_tasting_count', 'count' => 50 },
#     badge_image: 'badge(tt50).jpg' },
#   { id: 10, name: 'ウイスキーのためにカレー食べるのやめました？', description: '100回テイスティング登録しました。',
#     conditions: { 'type' => 'one_hundred_tasting_count', 'count' => 100 },
#     badge_image: 'badge(tt100).jpg' }
# ]
#
# whiskey_badges.each do |b|
#   badge = WhiskeyBadge.find_by(id: b[:id])
#   if badge
#     badge.update(b)
#     Rails.logger.info "バッジをアップデートしました: #{badge[:name]}"
#   else
#     badge = WhiskeyBadge.create!(b)
#     Rails.logger.info "バッジを作成しました: #{badge[:name]}"
#   end
# end
#
cocktail_badges = [
  { id: 1, name: '初心者', description: '初めてカクテルを作成しました。',
    conditions: { 'type' => 'new_cocktail_count', 'count' => 1 },
    badge_image: 'badge(t1).jpg' },
  { id: 2, name: '駆け出しバーテンダー（自宅）', description: '10回カクテルを作成しました',
    conditions: { 'type' => 'ten_cocktail_count', 'count' => 10 },
    badge_image: 'badge(t10).jpg' },
  { id: 3, name: 'バーテンダー？？', description: '20回カクテルを作成しました。',
    conditions: { 'type' => 'twenty_cocktail_count', 'count' => 20 },
    badge_image: 'badge(t20).jpg' },
  { id: 4, name: '宅飲みで酒作成係', description: '50回カクテルを作成しました。',
    conditions: { 'type' => 'fifty_cocktail_count', 'count' => 50 },
    badge_image: 'badge(t50).jpg' },
  { id: 5, name: 'バーテンダー', description: '100回カクテルを作成しました。',
    conditions: { 'type' => 'one_hundred_cocktail_count', 'count' => 100 },
    badge_image: 'badge(t100).jpg' }
]

cocktail_badges.each do |c|
  badge = CocktailBadge.find_by(id: c[:id])
  if badge
    badge.update(c)
    Rails.logger.info "バッジをアップデートしました: #{badge[:name]}"
  else
    badge = CocktailBadge.create!(c)
    Rails.logger.info "バッジを作成しました: #{badge[:name]}"
  end
end

regions = [
  { id: 1, region_name: '北海道地方' },
  { id: 2, region_name: '東北地方' },
  { id: 3, region_name: '関東地方' },
  { id: 4, region_name: '中部地方' },
  { id: 5, region_name: '関西地方' },
  { id: 6, region_name: '中国地方' },
  { id: 7, region_name: '四国地方' },
  { id: 8, region_name: '九州・沖縄地方' }
]

regions.each do |r|
  region = Region.find_by(id: r[:id])
  if region
    region.update(r)
  else
    Region.create!(r)
  end
end

distilleries = [
  { id: 1, region_id: 1, distillery_name: 'ニッカウヰスキー 余市蒸溜所' },
  { id: 2, region_id: 1, distillery_name: '堅展実業㈱ 厚岸蒸溜所' },
  { id: 3, region_id: 1, distillery_name: 'ニセコ蒸溜所' },
  { id: 4, region_id: 1, distillery_name: 'Kamui Whisky㈱（カムイウィスキー）' },
  { id: 5, region_id: 1, distillery_name: '馬追（マオイ）蒸溜所 / MAOI㈱' },
  { id: 6, region_id: 1, distillery_name: 'ベンチャーグレイン㈱ 苫小牧蒸留所' },
  { id: 7, region_id: 1, distillery_name: '十勝蒸溜所' },
  { id: 8, region_id: 2, distillery_name: 'ニッカウヰスキー株式会社 仙台工場 宮城峡蒸溜所' },
  { id: 9, region_id: 2, distillery_name: '遊佐蒸溜所' },
  { id: 10, region_id: 2, distillery_name: '笹の川酒造(株)' },
  { id: 11, region_id: 2, distillery_name: '月光川蒸留所' },
  { id: 12, region_id: 2, distillery_name: '出羽蒸留所/DEWA Distillery' },
  { id: 13, region_id: 2, distillery_name: '天鏡蒸溜所（天鏡株式会社）' },
  { id: 14, region_id: 3, distillery_name: 'ベンチャーウイスキー第2蒸留所' },
  { id: 15, region_id: 3, distillery_name: '八郷蒸溜所 / Yasato Distillery' },
  { id: 16, region_id: 3, distillery_name: '株式会社東亜酒造' },
  { id: 17, region_id: 3, distillery_name: '光酒造株式会社 鴻巣蒸溜所' },
  { id: 18, region_id: 3, distillery_name: '明利酒類株式会社' },
  { id: 19, region_id: 3, distillery_name: '西堀酒造' },
  { id: 20, region_id: 3, distillery_name: '須藤本家' },
  { id: 21, region_id: 3, distillery_name: '熊澤酒造 本社事務所' },
  { id: 22, region_id: 3, distillery_name: 'mitosaya薬草園蒸留所' },
  { id: 23, region_id: 3, distillery_name: '北軽井沢蒸留所' },
  { id: 24, region_id: 3, distillery_name: '牧野酒造株式会社' },
  { id: 25, region_id: 4, distillery_name: 'サントリー白州蒸溜所' },
  { id: 26, region_id: 4, distillery_name: 'マルス駒ヶ岳蒸溜所 本坊酒造' },
  { id: 27, region_id: 4, distillery_name: '新潟麦酒株式会社 忍蒸溜所' },
  { id: 28, region_id: 4, distillery_name: '小諸蒸留所' },
  { id: 29, region_id: 4, distillery_name: 'キリンディスティラリー富士御殿場蒸溜所' },
  { id: 30, region_id: 4, distillery_name: 'ガイアフロー静岡蒸溜所' },
  { id: 31, region_id: 4, distillery_name: '三郎丸蒸留所' },
  { id: 32, region_id: 4, distillery_name: 'サントリー知多蒸溜所' },
  { id: 33, region_id: 4, distillery_name: '新潟亀田蒸溜所' },
  { id: 34, region_id: 4, distillery_name: '戸塚酒造株式会社' },
  { id: 35, region_id: 4, distillery_name: '清洲桜醸造㈱ 製造部' },
  { id: 36, region_id: 4, distillery_name: '井川蒸溜所' },
  { id: 37, region_id: 4, distillery_name: '玉泉堂酒造' },
  { id: 38, region_id: 4, distillery_name: 'Nozawa Onsen Distillery（野沢温泉蒸留所）' },
  { id: 39, region_id: 4, distillery_name: '富士北麓蒸留所' },
  { id: 40, region_id: 4, distillery_name: '吉田電材蒸留所' },
  { id: 41, region_id: 4, distillery_name: '飛騨高山蒸溜所' },
  { id: 42, region_id: 4, distillery_name: 'SASAKAWA WHISKY（株）富嶽蒸溜所' },
  { id: 43, region_id: 4, distillery_name: 'オリエンタル金沢蒸溜所' },
  { id: 44, region_id: 4, distillery_name: '飯山マウンテンファーム蒸溜所' },
  { id: 45, region_id: 4, distillery_name: '相生ユニビオ 碧南蒸留所' },
  { id: 46, region_id: 4, distillery_name: 'Distillery Water Dragon' },
  { id: 47, region_id: 4, distillery_name: '八海醸造（株）深沢原蒸溜所' },
  { id: 48, region_id: 5, distillery_name: 'サントリー 山崎蒸溜所' },
  { id: 49, region_id: 5, distillery_name: '江井ヶ嶋酒造' },
  { id: 50, region_id: 5, distillery_name: '長濱蒸溜所' },
  { id: 51, region_id: 5, distillery_name: '京都みやこ蒸留所' },
  { id: 52, region_id: 5, distillery_name: '明石酒類醸造＆海峡蒸溜所ビジターセンター' },
  { id: 53, region_id: 5, distillery_name: '六甲山蒸溜所' },
  { id: 54, region_id: 5, distillery_name: '丹波蒸溜所' },
  { id: 55, region_id: 5, distillery_name: 'プラム食品株式会社/紀州熊野蒸溜所' },
  { id: 56, region_id: 5, distillery_name: '養父蒸溜所' },
  { id: 57, region_id: 5, distillery_name: '琵琶湖蒸溜所' },
  { id: 58, region_id: 5, distillery_name: '西山酒造場' },
  { id: 59, region_id: 5, distillery_name: '神息酒造奈良蒸留所' },
  { id: 60, region_id: 6, distillery_name: '宮下酒造(株)' },
  { id: 61, region_id: 6, distillery_name: '株式会社サクラオブルワリーアンドディスティラリー' },
  { id: 62, region_id: 6, distillery_name: '株式会社 三宅本店 本社' },
  { id: 63, region_id: 6, distillery_name: '千代むすび酒造 岡空本店' },
  { id: 64, region_id: 7, distillery_name: '阿波乃蒸溜所' },
  { id: 65, region_id: 7, distillery_name: '梅美人酒造株式会社' },
  { id: 66, region_id: 8, distillery_name: '嘉之助蒸溜所 KANOSUKE DISTILLERY' },
  { id: 67, region_id: 8, distillery_name: 'マルス津貫蒸溜所 津貫貴匠蔵 本坊酒造' },
  { id: 68, region_id: 8, distillery_name: 'ヘリオス酒造株式会社 本社' },
  { id: 69, region_id: 8, distillery_name: '久住蒸溜所' },
  { id: 70, region_id: 8, distillery_name: '（株）尾鈴山蒸留所' },
  { id: 71, region_id: 8, distillery_name: '御岳蒸留所' },
  { id: 72, region_id: 8, distillery_name: '新里酒造株式会社 州崎工場' },
  { id: 73, region_id: 8, distillery_name: '新道蒸溜所' },
  { id: 74, region_id: 8, distillery_name: '株式会社 山鹿蒸溜所' },
  { id: 75, region_id: 8, distillery_name: '天星酒造株式会社 菱田蒸溜所' },
  { id: 76, region_id: 8, distillery_name: '薩摩酒造(株) 火の神蒸溜所' },
  { id: 77, region_id: 8, distillery_name: '山都酒造(株)' },
  { id: 78, region_id: 8, distillery_name: '常楽酒造株式会社' },
  { id: 79, region_id: 8, distillery_name: '小牧醸造(株)' },
  { id: 80, region_id: 8, distillery_name: '梅ヶ枝酒造' },
  { id: 81, region_id: 8, distillery_name: '大石酒造場' },
  { id: 82, region_id: 8, distillery_name: '久米仙酒造株式会社 本社' },
  { id: 83, region_id: 8, distillery_name: 'まさひろ酒造 首里蔵' }
]

distilleries.each do |d|
  distillery = Distillery.find_by(id: d[:id])
  if distillery
    distillery.update(d)
    Rails.logger.info "蒸留所をアップデートしました: #{distillery[:distillery_name]}"
  else
    distillery = Distillery.create!(d)
    Rails.logger.info "蒸留所を作成しました: #{distillery[:distillery_name]}"
  end
end
