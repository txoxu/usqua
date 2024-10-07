# frozen_string_literal: true

module Users
  # ユーザーのパスワード管理コントローラ
  class PasswordsController < Devise::PasswordsController
    skip_before_action :require_login
    # GET /resource/password/new

    # POST /resource/password
    # def create
    #   super
    # end

    # GET /resource/password/edit?reset_password_token=abcdef

    # PUT /resource/password

    # protected

    # def after_resetting_password_path_for(resource)
    #   super(resource)
    # end

    # The path used after sending reset password instructions
    # def after_sending_reset_password_instructions_path_for(resource_name)
    #   super(resource_name)
    # end
  end
end
