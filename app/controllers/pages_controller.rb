class PagesController < ApplicationController
  def home; end

  def mypage
    @whiskeys = Whiskey.all
    @categories = Category.pluck(:category_name).uniq
    @whiskey_count_by_category = Whiskey.joins(:categories).group('categories.category_name').count
  end
end
