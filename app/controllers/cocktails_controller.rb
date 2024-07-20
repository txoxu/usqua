class CocktailsController < ApplicationController

  def index
    @cocktail_search_form = SearchCocktailsForm.new(search_params)
    @cocktails = @cocktail_search_form.search
  end

  private

  def search_params
    params.fetch(:search_cocktails_form, {}).permit(:keyword)
  end
end
