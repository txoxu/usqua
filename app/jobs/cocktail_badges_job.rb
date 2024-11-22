# frozen_string_literal: true

# カクテルテイスティングの称号
class CocktailBadgesJob < ApplicationJob
  # 非同期処理で優先される順位を設定（defaultで３つのjobファイルの優先順位はつけない）
  queue_as :default
  # *argsとすることで複数の引数を取得
  def perform(*args)
    # コントローラー側でuser_idとcocktail_tasting_idを配列として取得してそのindexを表示
    user_id = args[0]
    cocktail_tasting_id = args[1]
    # データベースからそれぞれを取得
    user = User.find(user_id)
    cocktail_tasting = CocktailTasting.find(cocktail_tasting_id)

    # データベースに格納してあるバッジのconditionsカラムを取得
    CocktailBadge.find_each do |badge|
      conditions = badge.conditions
      # もし、該当するバッジがあれば、user.rbのassign_badgeにbadgeデータを送る
      user.assign_cocktail_badge(badge) if meets_conditions?(conditions, cocktail_tasting, user)
    end
  end

  private

  def meets_conditions?(conditions, _cocktail_tasting, user)
    # valid_typesという変数に配列として格納 (%W とすることでスペースだけで配列として格納できる)
    valid_types = %w[new_cocktail_count ten_cocktail_count twenty_cocktail_count fifty_cocktail_count
                     one_hundred_cocktail_count ]
    # もし、conditionsカラムのjson形式でtypeとcountのなかのtypeと一致する条件するなら
    if valid_types.include?(conditions['type'])
      # ユーザーのカクテルのテイスティングを配列としてfa
      user.cocktail_tastings.count == conditions['count']
    else
      false
    end
  end
end
