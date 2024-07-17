class CocktailsController < ApplicationController

  def index
    @cocktails_search_form = SearchCocktailsForm.new(search_params)
    @cocktails = @cocktails_search_form.search
  end

  private

  def search_params
    params.fetch(:search_cocktails_form, {}).permit(:cocktail_name, :cocktail_create, :cocktail_origin, :cocktail_recipe)
  end
end
