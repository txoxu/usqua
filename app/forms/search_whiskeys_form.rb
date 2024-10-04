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
      relation = filter_by_text(relation)
      relation
  end
    private
  
    # カテゴリーで絞り込み
    def filter_by_category(relation)
      return relation unless category_names.present? || category_types.present?
  
      categories = Category.all

      # category_namesが存在する場合にフィルタリング
      if category_names.present?
        categories = categories.where(category_name: category_names)
      end
    
      # category_typesが存在する場合にフィルタリング
      if category_types.present?
        categories = categories.where(category_type: category_types)
      end

      category_ids = categories.pluck(:id).compact
      
      return relation unless category_ids.any?
  
      relation.by_category_ids(category_ids)
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
