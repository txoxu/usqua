class CocktailTastingsController < ApplicationController

  def new
    @cocktail_tasting = Cocktail_tasting.new
    @names = current_user.whiskeys.pluck(:name)
  end

  def create
    @cocktail_tasting = @cocktail.cocktail_tastings.build(cocktail_tasting_params)

    if @cocktail_tasting.save
      @cocktail_tasting.names << names
      redirect_to cocktail_path(cocktail)
    else
      flash.now[:danger] = 'カクテルテイスティング登録できませんでした'
      render :new
    end
  end

  private

  def cocktail_tasting_params
    params.require(:cocktail_tasting).permit(:cocktail_flavor, :tasting_recipe, names: [])
  end
end
