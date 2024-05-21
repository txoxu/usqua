class PagesController < ApplicationController
  def home; end

  def mypage
    @whiskeys = Whiskey.all
    @categories = Category.pluck(:name).uniq
    @whiskey_count_by_category = Whiskey.joins(:categories).group('categories.name').count
  end
end
