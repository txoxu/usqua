class TastingsController < ApplicationController
  before_action :set_whiskey

  def new
    @tasting = @whiskey.build_tasting
  end

  def create
    @tasting = @whiskey.build_tasting(tasting_params)
    tag_list = params[:tasting][:tag_ids].split(',')

    if @tasting.save
      @tasting.save_tags(tag_list)
      redirect_to whiskey_path(@whiskey)
    else
      render 'new'
    end
  end
end

private

def set_whiskey
  @whiskey = Whiskey.find(params[:whiskey_id])
end

def tasting_params
  params.require(:tasting).permit(:flavor, :aroma, :tasting_text, :whiskey_id, :tag_ids[])
end
