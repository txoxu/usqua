class ApplicationController < ActionController::Base
  before_action :require_login
  add_flash_types :success, :danger
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def not_authenticated
    redirect_to login_path
  end

  
  def configure_permitted_parameters  # メールアドレス以外の自分で追加したカラムを許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :password, :password_confirmation])
  end
end
