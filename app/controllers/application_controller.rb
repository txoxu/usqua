class ApplicationController < ActionController::Base
  before_action :require_login
  add_flash_types :success, :danger
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  private

  # def not_authenticated
  #  redirect_to new_user_session_path
  # end

  def after_sign_in_path_for(_resource)
    mypage_path # カスタムリダイレクト先
  end

  def configure_permitted_parameters # メールアドレス以外の自分で追加したカラムを許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
