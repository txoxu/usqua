# frozen_string_literal: true

# お気に入り登録のbookmarkのコントローラ
class BookmarksController < ApplicationController
  # マイページへ登録するアクション
  def create
    cocktail = Cocktail.find(params[:cocktail_id])
    current_user.bookmark(cocktail)
    redirect_to request.referer, success: 'マイページに登録しました'
  end

  # マイページへの登録を解除するアクション
  def destroy
    cocktail = current_user.bookmarks.find(params[:id]).cocktail
    current_user.unbookmark(cocktail)
    redirect_to request.referer, success: 'マイページの登録を解除しました'
  end
end
