# frozen_string_literal: true

# ユーザーの認証のプロバイダを格納するモデル
class UserProvider < ApplicationRecord
  belongs_to :user, optional: true
end
