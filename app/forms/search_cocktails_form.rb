# frozen_string_literal: true

# カクテル一覧の検索フォーム
class SearchCocktailsForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :keyword, :string

  def search
    return Cocktail.all if keyword.blank?

    Cocktail.keyword(keyword)
  end
end
