# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]
  skip_before_action :require_login

  # You should also create an action method in this controller like this:
  # def twitter
  # end
  def google_oauth2
    authorization   # コールバック
  end
  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
   def failure
     redirect_to root_path
   end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
  private
  # コールバックのメソッド定義
  def authorization   # APIから取得したユーザー情報はrequest.env["omniauth.auth"]に格納されてる
    user_provider_info = User.from_omniauth(request.env["omniauth.auth"])     # User.from_omniauth は、モデルで定義（次項）
    @user = user_provider_info[:user]    # deviseのヘルパーを使うため、＠user に代入(ハッシュ(モデルの返り値)から値を取得)

    if @user.persisted? # ユーザー登録済み(ログイン処理)
      provider = request.env['omniauth.auth'].provider
      provider_name = case provider
      when 'google_oauth2'
        'Google'
      else
        provider.capitalize
      end
      sign_in_and_redirect @user, event: :authentication   # authenticationのcallbackメソッドを呼んで、@user でログイン
      set_flash_message(:notice, :success, kind: provider_name) if is_navigational_format?
    else                # ユーザー未登録(新規登録画面へ遷移)
       # ユーザーが存在しない場合、新規登録処理
    @user.password = Devise.friendly_token[0, 20]  # 一時的なパスワードを設定
    @user.password_confirmation = @user.password

    if @user.save
      # 一時的なパスワードでログインして、パスワード設定画面にリダイレクト
      sign_in @user
      flash[:notice] = "Google認証が完了しました。次に、パスワードを設定してください。*プロフィールから変更は可能です"
      redirect_to edit_user_registration_path  # パスワード設定ページにリダイレクト
    else
      # エラー処理
      flash[:error] = "ユーザー登録に失敗しました。"
      redirect_to new_user_registration_path
      end
    end
  end
end
