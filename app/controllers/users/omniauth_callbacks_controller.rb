# app/controllers/users/omniauth_callbacks_controller.rb
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :require_login, only: [:google_oauth2]

  def google_oauth2
    authorization   # コールバック
  end

  def failure
    redirect_to root_path
  end

  private
  # コールバックのメソッド定義
  def authorization   # APIから取得したユーザー情報はrequest.env["omniauth.auth"]に格納されてる
    user_provider_info = User.from_omniauth(request.env["omniauth.auth"])     # User.from_omniauth は、モデルで定義（次項）
    @user = user_provider_info[:user]    # deviseのヘルパーを使うため、＠user に代入(ハッシュ(モデルの返り値)から値を取得)

    if @user.persisted? # ユーザー登録済み(ログイン処理)
      sign_in_and_redirect @user, event: :authentication   # authenticationのcallbackメソッドを呼んで、@user でログイン
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else                # ユーザー未登録(新規登録画面へ遷移)
      @user_provider_id = user_provider_info[:user_provider].id                  # ハッシュ(モデルの返り値)から取得した、認証データを一時的に保持(ユーザー登録ページに渡す)
      render template: new_user_registration_url   # ユーザー登録ページに遷移
    end
  end
end
