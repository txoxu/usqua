class WhiskeysController < ApplicationController
  def new
    @whiskey = Whiskey.new
    @category_names = Category.select(:category_name).distinct
    @category_types = Category.select(:category_type).distinct
    @quantities = RemmainingQuantity.all
  end
  
  def create
    @whiskey = current_user.whiskeys.build(whiskey_params)
    categories = find_existing_categories
    remmaining_quantity = RemmainingQuantity.find_by(id: params[:whiskey][:remmaining_quantity_id])

    if categories.any? && remmaining_quantity && @whiskey.save
      if params[:whiskey][:image].present?
        @whiskey.update(image: params[:whiskey][:image])
      else
        @whiskey.update(image: File.open(Rails.root.join('app','assets','images','image.png')))
      end
      @whiskey.categories << categories
      @whiskey.remmaining_quantity = remmaining_quantity
      redirect_to choose_next_step_whiskey_path(@whiskey), success: t('whiskeys.create.success')
    else
      @category_names = Category.select(:category_name).distinct
      @category_types = Category.select(:category_type).distinct
      @quantities = RemmainingQuantity.all
      flash.now[:danger] = t('whiskeys.create.danger')
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @search_form = SearchWhiskeysForm.new(search_params)
    @whiskeys = @search_form.search.where(user_id: current_user.id)

    @category_names = Category.select(:category_name).distinct
    @category_types = Category.select(:category_type).distinct
    @quantity = RemmainingQuantity.select(:quantity)
  end

  def show
    @whiskey = Whiskey.find(params[:id])
    @categories = @whiskey.categories
    @tastings = @whiskey.tastings
    @quantities = RemmainingQuantity.all
  end

  def edit
    @whiskey = current_user.whiskeys.find(params[:id])
    @category_names = Category.select(:category_name).distinct
    @category_types = Category.select(:category_type).distinct
    @quantities = RemmainingQuantity.all
  end

  def update
    @whiskey = current_user.whiskeys.find(params[:id])
    categories = find_existing_categories
    remmaining_quantity = RemmainingQuantity.find_by(id: params[:whiskey][:remmaining_quantity_id])
    
    if @whiskey.update(whiskey_params)
      if params[:whiskey][:image].present?
        @whiskey.update(image: params[:whiskey][:image])
      else
        @whiskey.update(image: File.open(Rails.root.join('app','assets','images','image.png')))
      end
      @whiskey.categories = categories
      @whiskey.remmaining_quantity = remmaining_quantity
      redirect_to whiskeys_path, success: t('whiskeys.update.success')
    else
      flash.now[:danger] = t('whiskeys.update.danger')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @whiskey = current_user.whiskeys.find(params[:id])
    @whiskey.destroy!
    redirect_to whiskeys_path, danger: t('whiskeys.destroy.danger'), status: :see_other
  end


  def choose_next_step
    @whiskey = current_user.whiskeys.find(params[:id])
  end


  private

  def whiskey_params
    params.require(:whiskey).permit(:name, :text, :image, :remmaining_quantity_id, category_names: [], category_types: [])
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
