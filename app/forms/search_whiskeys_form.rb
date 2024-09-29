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

    if category_names.present? && category_types.present?
      category_ids = Category.where(category_name: category_names, category_type: category_types).pluck(:id)
      relation = relation.by_category_ids(category_ids)
    elsif category_names.present?
      category_ids = Category.where(category_name: category_names).pluck(:id)
      relation = relation.by_category_ids(category_ids)
    elsif category_types.present?
      category_ids = Category.where(category_type: category_types).pluck(:id)
      relation = relation.by_category_ids(category_ids)
    end

    name_words.each do |word|
      relation = relation.name_contain(word)
    end

    text_words.each do |word|
      relation = relation.text_contain(word)
    end
    relation
  end

  private

  def name_words
    name.present? ? name.split(nil) : []
  end

  def text_words
    text.present? ? text.split(nil) : []
  end
end
