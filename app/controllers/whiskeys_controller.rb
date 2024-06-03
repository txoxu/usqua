class WhiskeysController < ApplicationController
  def new
    @whiskey = Whiskey.new
    @category_names = Category.select(:category_name).distinct
    @category_types = Category.select(:category_type).distinct
  end
  
  def create
    @whiskey = Whiskey.new(whiskey_params)
    categories = find_existing_categories

    if categories.any? && @whiskey.save
      @whiskey.categories << categories
      redirect_to choose_next_step_whiskey_path(@whiskey), notice: 'ウイスキーの登録が完了しました'
    else
      @category_names = Category.select(:id, :category_name).distinct
      @category_types = Category.select(:id, :category_type).distinct
      render :new
    end
  end

  def index
    @search_form = SearchWhiskeysForm.new(search_params)
    @whiskeys = @search_form.search

    @category_names = Category.select(:category_name).distinct
    @category_types = Category.select(:category_type).distinct
  end

  def show
    @whiskey = Whiskey.find(params[:id])
    @categories = @whiskey.categories
    @tastings = @whiskey.tastings
  end

  def edit
    @whiskey = Whiskey.find(params[:id])
    @category_names = Category.select(:category_name).distinct
    @category_types = Category.select(:category_type).distinct

    #@selected_category_name = @whiskey.categories.pluck(:category_name).first
  end

  def update
    @whiskey = Whiskey.find(params[:id])
    categories = find_existing_categories
    
    if @whiskey.update(whiskey_params)
      @whiskey.categories = categories
      redirect_to whiskeys_path, notice: 'ウイスキーが更新されました'
    else
      render :edit
    end
  end

  def destroy
    @whiskey = Whiskey.find(params[:id])
    @whiskey.destroy
    redirect_to whiskeys_path, notice: 'ウイスキーが削除されました', status: :see_other
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

  def search_params
    params.fetch(:search_whiskeys_form, {}).permit(:category_names, :category_types, :name, :text)
  end
end
