# frozen_string_literal: true

# カクテルのコントローラ
class CocktailsController < ApplicationController
  skip_before_action :require_login

  def index
    @cocktail_search_form = SearchCocktailsForm.new(search_params)
    @cocktails = @cocktail_search_form.search.page(params[:page])
    @new_badges = fetch_new_badges
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @cocktail_tastings = @cocktail.cocktail_tastings
    @next_cocktail = Cocktail.where('id > ?', @cocktail.id).order(:id).first
    @prev_cocktail = Cocktail.where('id < ?', @cocktail.id).order(:id).last
  end

  def update_cocktail_badge_seen
    # ユーザーの獲得したバッジの
    badges = current_user.user_cocktail_badges.where(cocktail_badge_id: params[:badge_ids])

    badges.each do |badge|
      badge.update(seen: true)
    end

    head :ok
  end

  private

  def search_params
    params.fetch(:search_cocktails_form, {}).permit(:keyword)
  end

  # index
  def fetch_new_badges
    current_user.user_cocktail_badges.where(seen: false)
                .includes(:cocktail_badge)
                .map(&:cocktail_badge)
                .as_json
  end
end
