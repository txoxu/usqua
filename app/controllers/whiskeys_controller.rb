class WhiskeysController < ApplicationController
  def new
    @whiskey = Whiskey.new
    @categories = Category.select(:name).distinct
    @category_types = Category.select(:category_type).distinct
  end
  
  def create
    @whiskey = Whiskey.new(whiskey_params)
    if @whiskey.save
      redirect_to '#', notice: 'ウイスキーの登録が完了しました'
    else
      @categories = Category.all
      render :new
    end
  end


  private

  def whiskey_params
    params.require(:whiskey).permit(:name, :text, :image, :remmaining_quantity, :category_id, category_attributes: [:name, :category_type])
  end
end
