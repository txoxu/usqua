# frozen_string_literal: true

class BookmarksController < ApplicationController
  def create
    cocktail = Cocktail.find(params[:cocktail_id])
    current_user.bookmark(cocktail)
    redirect_to request.referer, success: 'マイページに登録しました'
  end

  def destroy
    cocktail = current_user.bookmarks.find(params[:id]).cocktail
    current_user.unbookmark(cocktail)
    redirect_to request.referer, success: 'マイページの登録を解除しました'
  end
end
