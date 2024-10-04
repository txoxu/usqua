# frozen_string_literal: true

# カクテル一覧の検索フォーム
class SearchCocktailsForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :keyword, :string

  def search
    return Cocktail.all if keyword.blank?

    Cocktail.joins(:base_cocktail).where(
    "cocktails.cocktail_name LIKE :keyword OR
     cocktails.cocktail_create LIKE :keyword OR
     cocktails.cocktail_origin LIKE :keyword OR
     cocktails.cocktail_recipe LIKE :keyword OR
     base_cocktails.base_name LIKE :keyword",
    keyword: "%#{keyword}%"
  )
  end
end
