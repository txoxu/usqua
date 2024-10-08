# frozen_string_literal: true

# ApplicationControllerはすべてのコントローラのベースクラスです
class ApplicationController < ActionController::Base
  before_action :require_login
  add_flash_types :success, :danger
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  private

  # def not_authenticated
  #  redirect_to new_user_session_path
  # end

  # サインイン後のリダイレクト先を指定
  def after_sign_in_path_for(_resource)
    mypage_path # カスタムリダイレクト先
  end

  # メールアドレス以外の自分で追加したカラムを許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
