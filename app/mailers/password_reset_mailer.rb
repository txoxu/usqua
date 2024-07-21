class PasswordResetMailer < ApplicationMailer

  def reset
    @user = params[:user]
    @token = params[:user].signed_id(purpose: "password_reset", expires_in: 15.minutes)
    mail to: @user.email, subject: 'パスワードリセット申請ありがとうございます'
  end
end
