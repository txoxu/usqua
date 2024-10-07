# frozen_string_literal: true

# ウイスキーのテイスティングのコントローラ
class TastingsController < ApplicationController
  before_action :set_whiskey
  before_action :set_tasting, only: %i[edit update show destroy]

  def new
    @tasting = @whiskey.tastings.build
  end

  def create
    @tasting = @whiskey.tastings.build(tasting_params)

    if @tasting.save
      redirect_to whiskeys_path, success: t('tastings.create.success')
    else
      flash.now[:danger] = t('tastings.create.danger')
      render :new
    end
  end

  def show
    @tasting = @whiskey.tastings.find(params[:id])
  end

  def edit
    @tasting = @whiskey.tastings.find(params[:id])
  end

  def update
    if @tasting.update(tasting_params)
      redirect_to whiskeys_path, success: t('tastings.update.success')
    else
      flash.now[:danger] = t('tastings.update.danger')
      render :edit
    end
  end

  def destroy
    @tasting = @whiskey.tastings.find(params[:id])
    @tasting.destroy!
    redirect_to whiskey_path(@whiskey), danger: t('tastings.destroy.danger'), status: :see_other
  end

  private

  def set_whiskey
    @whiskey = Whiskey.find(params[:whiskey_id])
  end

  def set_tasting
    @tasting = @whiskey.tastings.find(params[:id])
  end

  def tasting_params
    params.require(:tasting).permit(:tasting_type, :tasting_text, :flavor, :aroma, :whiskey_id, :body, :finish,
                                    :balance)
  end
end
