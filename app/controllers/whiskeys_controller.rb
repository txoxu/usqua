# frozen_string_literal: true

# ウイスキーのコントローラ
class WhiskeysController < ApplicationController
  before_action :set_whiskey, only: %i[edit update destroy choose_next_step]
  before_action :prepare_form_data, only: %i[new edit create index]

  def new
    @whiskey = Whiskey.new
  end

  def create
    @whiskey = current_user.whiskeys.build(whiskey_params)
    categories = find_existing_categories
    remmaining_quantity = RemmainingQuantity.find_by(id: params[:whiskey][:remmaining_quantity_id])

    if categories.any?
      save_whiskey_with_categories(categories, remmaining_quantity)
    else
      flash.now[:danger] = t('whiskeys.create.danger')
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @search_form = SearchWhiskeysForm.new(search_params)
    @whiskeys = @search_form.search.where(user_id: current_user.id).page(params[:page])
    @tastings = Tasting.where(whiskey_id: @whiskeys.pluck(:id))
    @new_badges = fetch_new_badges
  end

  def edit; end

  def update
    categories = find_existing_categories
    RemmainingQuantity.find_by(id: params[:whiskey][:remmaining_quantity_id])

    if @whiskey.update(whiskey_params)
      process_successful_update(categories, remmaining_quantity)
    else
      flash.now[:danger] = t('whiskeys.update.danger')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @whiskey.destroy!
    redirect_to whiskeys_path, danger: t('whiskeys.destroy.danger'), status: :see_other
  end

  def choose_next_step; end

  def update_badge_seen
    badges = current_user.user_whiskey_badges.where(whiskey_badge_id: params[:badge_ids])

    badges.each do |badge|
      badge.update(seen: true)
    end

    head :ok
  end

  private

  def set_whiskey
    @whiskey = current_user.whiskeys.find(params[:id])
  end

  def assign_save(categories, _remaining_quantity)
    @whiskey.assign_image(params[:whiskey][:image])
    @whiskey.categories << categories
    @whiskey.assign_remmaining_quantity(remmaining_quantity)
  end

  def whiskey_params
    params.require(:whiskey).permit(:name, :text, :image, :remmaining_quantity_id, category_names: [],
                                                                                   category_types: [])
  end

  def find_existing_categories
    Category.where(category_name: params[:whiskey][:category_names])
            .where(category_type: params[:whiskey][:category_types])
  end

  def prepare_form_data
    @category_names = Category.select(:category_name).distinct
    @category_types = Category.select(:category_type).distinct
    @quantities = RemmainingQuantity.all
  end

  def search_params
    params.fetch(:search_whiskeys_form, {}).permit(%i[category_names category_types name text])
  end

  def fetch_new_badges
    current_user.user_whiskey_badges.where(seen: false)
                .includes(:whiskey_badge)
                .map(&:whiskey_badge)
                .as_json
  end

  def process_successful_update(categories, remmaining_quantity)
    assign_save(categories, remmaining_quantity)
    redirect_to whiskeys_path, success: t('whiskeys.update.success')
  end

  def assign_badges_to_user
    badge_service = WhiskeyBadgeService.new(current_user, @whiskey)
    badge_service.assign_badges
  end

  def adjacent_whiskeys
    next_whiskey = current_user.whiskeys.where('id > ?', @whiskey.id).order(:id).first
    prev_whiskey = current_user.whiskeys.where('id < ?', @whiskey.id).order(:id).last
    [next_whiskey, prev_whiskey]
  end

  def save_whiskey_with_categories(categories, remmaining_quantity)
    if @whiskey.save
      assign_save(categories, remmaining_quantity)
      assign_badges_to_user
      redirect_to choose_next_step_whiskey_path(@whiskey), success: t('whiskeys.create.success')
    else
      flash.now[:danger] = t('whiskeys.create.danger')
      render :new, status: :unprocessable_entity
    end
  end
end
