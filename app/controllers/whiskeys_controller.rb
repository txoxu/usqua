class WhiskeysController < ApplicationController
  def new
    @whiskey = Whiskey.new
    @category_names = Category.select(:category_name).distinct
    @category_types = Category.select(:category_type).distinct
  end
  
  def create
    @whiskey = Whiskey.new(whiskey_params)
    categories = find_existing_categories
    logger.debug "Parameters: #{params.inspect}"
    if categories.any? && @whiskey.save
      @whiskey.categories << categories
      redirect_to choose_next_step_whiskey_path(@whiskey), notice: 'ウイスキーの登録が完了しました'
    else
      @category_names = Category.select(:id, :category_name).distinct
      @category_types = Category.select(:id, :category_type).distinct
      render :new
    end
  end

  def choose_next_step
    @whiskey = Whiskey.find(params[:id])
  end


  private

  def whiskey_params
    params.require(:whiskey).permit(:name, :text, :image, :remmaining_quantity, category_names: [], category_types: [])
  end

  def find_existing_categories
    category_names = params[:whiskey][:category_names]
    category_types = params[:whiskey][:category_types]

    Category.where(category_name: category_names).where(category_type: category_types)
  end
end
