class DistilleriesController < ApplicationController
  def index
    @regions = Region.all
    @distilleries = Distillery.all
  end

  def show
  end
end
