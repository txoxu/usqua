class Users::RegistrationsController <  Devise::RegistrationsController
  skip_before_action :require_login, only: [:create]
  def create
    if params[:user_provider_auth] == 'true'
      pass = Devise.friendly_token    # PWの自動生成
      params[:user][:password] = pass
      params[:user][:password_confirmation] = pass
    end
    super
  end
end
