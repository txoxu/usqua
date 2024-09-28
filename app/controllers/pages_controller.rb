# frozen_string_literal: true

class PagesController < ApplicationController
  def home; end

  def mypage
    @whiskeys = current_user.whiskeys
    @categories = Category.distinct.pluck(:category_name)
    whiskey_counts = current_user.whiskeys
                                 .joins(:categories)
                                 .group('categories.category_name')
                                 .count

    @whiskey_count_by_category = @categories.index_with do |category|
      whiskey_counts[category] || 0
    end.sort_by { |_, count| -count }.to_h
    @bookmark_cocktails = current_user.bookmark_cocktails.includes(:user).order(created_at: :desc)
  end
end
