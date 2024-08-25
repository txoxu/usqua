class Users::RegistrationsController < Devise::OmniauthCallbacksController

  def create
    if params[:user_provider_auth] == 'true'
      pass = Devise.friendly_token    # PWの自動生成
      params[:user][:password] = pass
      params[:user][:password_confirmation] = pass
    end
    super
  end
end
