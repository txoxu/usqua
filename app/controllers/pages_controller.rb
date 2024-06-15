class PagesController < ApplicationController

  def home; end

  def mypage
    @whiskeys = current_user.whiskeys
    @categories = Category.pluck(:category_name).uniq
    @whiskey_count_by_category = current_user.whiskeys.joins(:categories).group('categories.category_name').count
  end

end
