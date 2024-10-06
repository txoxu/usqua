# frozen_string_literal: true

# ウイスキー一覧の検索フォーム
class SearchWhiskeysForm
  # app/forms/search_whiskeys_form.rb
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :text, :string
  attribute :category_names, :string
  attribute :category_types, :string

  def search
    relation = Whiskey.distinct
    relation = filter_by_category(relation)
    relation = filter_by_name(relation)
    filter_by_text(relation)
    relation
  end

  private

  # カテゴリーで絞り込み
  def filter_by_category(relation)
    return relation unless filtering_conditions_present?

    category_ids = fetch_category_ids
    return relation unless category_ids.any?

    relation.by_category_ids(category_ids)
  end

  def filtering_conditions_present?
    category_names.present? || category_types.present?
  end

  def fetch_category_ids
    categories = Category.all
    categories = filter_by_category_names(categories)
    categories = filter_by_category_types(categories)
    categories.pluck(:id).compact
  end

  def filter_by_category_names(categories)
    return categories if category_names.blank?

    categories.where(category_name: category_names)
  end

  def filter_by_category_types(categories)
    return categories if category_types.blank?

    categories.where(category_type: category_types)
  end

  # 名前で絞り込み
  def filter_by_name(relation)
    name_words.each do |word|
      relation = relation.name_contain(word)
    end
    relation
  end

  # テキストで絞り込み
  def filter_by_text(relation)
    text_words.each do |word|
      relation = relation.text_contain(word)
    end
    relation
  end

  def name_words
    name.present? ? name.split(nil) : []
  end

  def text_words
    text.present? ? text.split(nil) : []
  end
end
