# frozen_string_literal: true

# カクテルテイスティングのコントローラ
class CocktailTastingsController < ApplicationController
  before_action :set_cocktail
  before_action :set_cocktail_tasting, only: %i[update destroy edit]
  before_action :set_whiskeys, only: %i[new edit update]

  def new
    @cocktail_tasting = @cocktail.cocktail_tastings.build
  end

  def create
    @cocktail_tasting = @cocktail.cocktail_tastings.build(cocktail_tasting_params)
    assign_whiskey_and_user
    if @cocktail_tasting.save
      cocktail_job(current_user, @cocktail_tasting)
      redirect_to cocktails_path, success: t('cocktail_tastings.create.success')
    else
      flash.now[:danger] = t('cocktail_tastings.create.danger')
      render :new
    end
  end

  def edit; end

  def update
    assign_whiskey_and_user
    if @cocktail_tasting.update(cocktail_tasting_params)
      redirect_to cocktails_path, success: t('cocktail_tastings.update.success')
    else
      flash.now[:danger] = t('cocktail_tastings.update.danger')
      render :new
    end
  end

  def destroy
    @cocktail_tasting.destroy!
    redirect_to cocktails_path, danger: t('cocktail_tastings.destroy.danger')
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def set_whiskeys
    @whiskeys = current_user.whiskeys
  end

  def set_cocktail_tasting
    @cocktail_tasting = @cocktail.cocktail_tastings.find(params[:id])
  end

  def assign_whiskey_and_user
    whiskey_name = params[:cocktail_tasting][:name]
    @cocktail_tasting.whiskey = current_user.whiskeys.find_by(name: whiskey_name)
    @cocktail_tasting.user = current_user
  end

  def cocktail_job(current_user, @cocktail_tasting)
    CocktailBadgesJob.perform_later(current_user.id, @cocktail_tasting.id)
  end

  def cocktail_tasting_params
    params.require(:cocktail_tasting).permit(:aroma, :flavor, :appearance, :finish, :mouthfeel, :others, :whiskey_id,
                                             :whiskey_name)
  end
end
