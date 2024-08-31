class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[show edit update]

  def show
    current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(current_user), success: "編集しました"
    else
      flash[danger] = "編集できません"
      render :edit
    end
  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
