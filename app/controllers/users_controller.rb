# frozen_string_literal: true
# ユーザーのプロフィールのコントローラ
class UsersController < ApplicationController
  def show
    current_user
  end
end
