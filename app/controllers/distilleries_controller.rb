class DistilleriesController < ApplicationController
  def index
    @regions = Region.all
    @distilleries = Distillery.all
  end

  def show
    @distillery = Distillery.find(params[:id])
  end
end
