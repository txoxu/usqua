class DistilleriesController < ApplicationController
  def index
    @regions = Region.all
    @distillery_search_form =SearchDistilleriesForm.new(search_params)
    @distilleries = @distillery_search_form.search
  end

  def show
  end

  private

  def search_params
    params.fetch(:search_distilleries_form, {}).permit(:keyword)
  end
end
