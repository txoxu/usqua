# frozen_string_literal: true
# カクテルテイスティングのコントローラ

class CocktailTastingsController < ApplicationController
  before_action :set_cocktail_tasting
  before_action :set_whiskeys, only: %i[new edit update]
  def new
    @cocktail_tasting = @cocktail.cocktail_tastings.build
  end

  def create
    @cocktail_tasting = @cocktail.cocktail_tastings.build(cocktail_tasting_params)
    whiskey_name = params[:cocktail_tasting][:name]
    whiskey = current_user.whiskeys.find_by(name: whiskey_name)
    @cocktail_tasting.whiskey_id = whiskey.id
    @cocktail_tasting.user_id = current_user.id
    if @cocktail_tasting.save
      redirect_to cocktails_path, success: t('cocktail_tastings.create.success')
    else
      flash.now[:danger] = t('cocktail_tastings.create.danger')
      render :new
    end
  end

  def edit
    @cocktail_tasting = @cocktail.cocktail_tastings.find(params[:id])
  end

  def update
    @cocktail_tasting = @cocktail.cocktail_tastings.find(params[:id])
    whiskey_name = params[:cocktail_tasting][:name]
    whiskey = current_user.whiskeys.find_by(name: whiskey_name)
    @cocktail_tasting.whiskey_id = whiskey.id
    @cocktail_tasting.user_id = current_user.id
    if @cocktail_tasting.update(cocktail_tasting_params)
      redirect_to cocktails_path, success: t('cocktail_tastings.update.success')
    else
      flash.now[:danger] = t('cocktail_tastings.update.danger')
      render :new
    end
  end

  def destroy
    @cocktail_tasting = @cocktail.cocktail_tastings.find(params[:id])
    @cocktail_tasting.destroy!
    redirect_to cocktails_path, danger: t('cocktail_tastings.destroy.danger')
  end

  private

  def set_cocktail_tasting
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def set_whiskeys
    @whiskeys = current_user.whiskeys
  end

  def cocktail_tasting_params
    params.require(:cocktail_tasting).permit(:aroma, :flavor, :appearance, :finish, :mouthfeel, :others, :whiskey_id,
                                             :whiskey_name)
  end
end
