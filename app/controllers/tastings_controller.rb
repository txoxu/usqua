class TastingsController < ApplicationController
  before_action :set_whiskey

  def new
    @tasting = @whiskey.tastings.build
  end

  def create
    @tasting = @whiskey.tastings.build(tasting_params)
    tag_list = params[:tasting][:tag_ids].split(',')

    if @tasting.save
      @tasting.save_tags(tag_list)
      redirect_to choose_next_step_whiskey_path(@whiskey), notice: 'テイスティングを登録しました'
    else
      render 'new'
    end
  end

  private

  def set_whiskey
    @whiskey = Whiskey.find(params[:whiskey_id])
  end

  def tasting_params
    params.require(:tasting).permit(:tasting_type, :flavor, :aroma, :tasting_text, :whiskey_id, tag_ids: [])
  end

end
