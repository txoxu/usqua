class PagesController < ApplicationController
  def home; end

  def mypage
    @whiskeys = Whiskey.all
    @categories = Category.all
    @whiskey_count_by_category = Whiskey.joins(:categories).group('categories.id').count
  end
end
