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
  
    if categories.any? && @whiskey.save
      @whiskey.assign_image(params[:whiskey][:image])
      @whiskey.categories << categories
      @whiskey.assign_remmaining_quantity(remmaining_quantity)
  
      WhiskeyBadgesJob.perform_later(current_user.id, @whiskey.id)
      redirect_to choose_next_step_whiskey_path(@whiskey), success: t('whiskeys.create.success')
    else
      prepare_form_data
      flash.now[:danger] = t('whiskeys.create.danger')
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @search_form = SearchWhiskeysForm.new(search_params)
    @whiskeys = @search_form.search.where(user_id: current_user.id)

    @whiskeys = @whiskeys.page(params[:page])

    @category_names = Category.select(:category_name).distinct
    @category_types = Category.select(:category_type).distinct

    @quantity = RemmainingQuantity.select(:quantity)

    @tastings = Tasting.where(whiskey_id: @whiskeys.pluck(:id))

    @new_badges = current_user.user_whiskey_badges.where(seen: false).includes(:whiskey_badge).map(&:whiskey_badge).as_json
  end

  def show
    @whiskey = Whiskey.find(params[:id])
    @categories = @whiskey.categories
    @tastings = @whiskey.tastings
    @quantities = RemmainingQuantity.all

    @next_whiskey = current_user.whiskeys.where('id > ?', @whiskey.id).order(:id).first
    @prev_whiskey = current_user.whiskeys.where('id < ?', @whiskey.id).order(:id).last
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
        @whiskey.update(image: File.open(Rails.root.join('app', 'assets', 'images', 'image.png')))
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

  def update_badge_seen
    badge_ids = params[:badge_ids]
    user = current_user

    # `seen` フラグを `true` に更新する
    user.user_whiskey_badges.where(whiskey_badge_id: badge_ids).update_all(seen: true)

    head :ok
  end

  private

  def whiskey_params
    params.require(:whiskey).permit(:name, :text, :image, :remmaining_quantity_id, category_names: [],
                                                                                   category_types: [])
  end

  def find_existing_categories
    category_names = params[:whiskey][:category_names]
    category_types = params[:whiskey][:category_types]

    Category.where(category_name: category_names).where(category_type: category_types)
  end

  def prepare_form_data
    @category_names = Category.select(:category_name).distinct
    @category_types = Category.select(:category_type).distinct
    @quantities = RemmainingQuantity.all
  end

  def search_params
    params.fetch(:search_whiskeys_form, {}).permit(:category_names, :category_types, :name, :text)
  end
end
