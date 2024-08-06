class CocktailTastingsController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @cocktail_tasting = @cocktail.cocktail_tastings.build
    @whiskeys = current_user.whiskeys
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @cocktail_tasting = @cocktail.cocktail_tastings.build(cocktail_tasting_params)
    whiskey_name = params[:cocktail_tasting][:name]
    whiskey = current_user.whiskeys.find_by(name: whiskey_name)
    @cocktail_tasting.whiskey_id = whiskey.id
    @cocktail_tasting.user_id = current_user.id
    if @cocktail_tasting.save
      redirect_to cocktails_path, success: t('cocktail_tastings.create.success')
    else
      flash.now[:danger] = t('cocktail_tastings.create.danger')
      render :newq
    end
  end

  private

  def cocktail_tasting_params
    params.require(:cocktail_tasting).permit(:cocktail_flavor, :tasting_recipe, :whiskey_id)
  end
end
