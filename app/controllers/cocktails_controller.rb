class CocktailsController < ApplicationController

  def index
    @cocktail_search_form = SearchCocktailsForm.new(search_params)
    @cocktails = @cocktail_search_form.search
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @next_cocktail = Cocktail.where('id > ?', @cocktail.id).order(:id).first
    @prev_cocktail = Cocktail.where('id < ?', @cocktail.id).order(:id).last
  end


  private

  def search_params
    params.fetch(:search_cocktails_form, {}).permit(:keyword)
  end
end
