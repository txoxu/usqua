# frozen_string_literal: true

# マイページのコントローラ
class PagesController < ApplicationController
  def home; end

  def mypage
    @whiskeys = current_user.whiskeys
    @categories = Category.distinct.pluck(:category_name)
    @whiskey_count_by_category = calculate_whiskey_count_by_category
    @bookmark_cocktails = current_user.bookmark_cocktails.order(created_at: :desc)

  end

  private

  def calculate_whiskey_count_by_category
    whiskey_counts = current_user.whiskeys
                                 .joins(:categories)
                                 .group('categories.category_name')
                                 .count

    @categories.index_with { |category| whiskey_counts[category] || 0 }
               .sort_by { |_, count| -count }
               .to_h
  end
end
