# frozen_string_literal: true

# カクテルのコントローラ
class CocktailsController < ApplicationController
  skip_before_action :require_login

  def index
    @cocktail_search_form = SearchCocktailsForm.new(search_params)
    @cocktails = @cocktail_search_form.search.page(params[:page])
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @cocktail_tastings = @cocktail.cocktail_tastings
    @next_cocktail = Cocktail.where('id > ?', @cocktail.id).order(:id).first
    @prev_cocktail = Cocktail.where('id < ?', @cocktail.id).order(:id).last
  end

  private

  def search_params
    params.fetch(:search_cocktails_form, {}).permit(:keyword)
  end
end
