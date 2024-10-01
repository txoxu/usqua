# frozen_string_literal: true

module Users
  # ユーザーセッションの管理コントローラ
  class SessionsController < Devise::SessionsController
    before_action :configure_sign_in_params, only: [:create]
    skip_before_action :require_login
    # GET /resource/sign_in

    # POST /resource/sign_in

    # DELETE /resource/sign_out

    protected

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_in_params
      devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    end

    def after_sign_in_path_for(_resource)
      mypage_path
    end

    def after_sign_out_path_for(_resource_or_scope)
      root_path
    end
  end
end
