class WhiskeysController < ApplicationController
  def new
    @whiskey = Whiskey.new
    @categories = Category.select(:name).distinct
    @category_types = Category.select(:category_type).distinct
  end
  
  def create
    @whiskey = Whiskey.new(whiskey_params)
    logger.debug "Parameters: #{params.inspect}"
    if @whiskey.save
      redirect_to choose_next_step_whiskeys_path, notice: 'ウイスキーの登録が完了しました'
    else
      @categories = Category.select(:id, :name).distinct
      @category_types = Category.select(:id, :category_type).distinct
      render :new
    end
  end

  def choose_next_step ;end


  private

  def whiskey_params
    params.require(:whiskey).permit(:name, :text, :image, :remmaining_quantity, category_ids: [])
  end
end
