class TastingsController < ApplicationController

  def new
    @tasting = Tasting.new
    @tags = Tag.new
  end

  def create
    @tasting = Tasting.new(tasting_params)
  end
end

private

def tasting_params
  params.require(:tasting).permit(:flavor, :aroma, :tasting_text, )
end
