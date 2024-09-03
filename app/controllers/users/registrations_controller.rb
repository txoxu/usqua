# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  skip_before_action :require_login

  # GET /resource/sign_up
   def new
     super
   end

  # POST /resource
  def create
   if params[:user_provider_auth] == 'true'
     pass = Devise.friendly_token    # PWの自動生成
     params[:user][:password] = pass
     params[:user][:password_confirmation] = pass
   end
    super
  end

  # GET /resource/edit
   def edit
     super
   end

  # PUT /resource
   def update
      # 設定されたパラメータを取得
      if resource.update_with_password(account_update_params)
        # パスワードが正しく更新された場合
        bypass_sign_in(resource, scope: :user) # ユーザーのサインイン状態を維持
        redirect_to mypage_path, success: "パスワードを設定しました。"
      else
        # パスワードの更新に失敗した場合
        render :edit
      end
   end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected
  private

  def account_update_params
    params.require(:user).permit(:password, :password_confirmation)
  end
  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_up_params
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
   end

  # If you have extra params to permit, append them to the sanitizer.
   def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update, keys: [:password, :password_confirmation])
   end

  # The path used after sign up.
   def after_sign_up_path_for(resource)
     mypage_path
   end

  # The path used after sign up for inactive accounts.
   def after_inactive_sign_up_path_for(resource)
     mypage_path
   end

   #def update_resource(resource, params)
   # resource.update_without_password(params)
   #end
end
