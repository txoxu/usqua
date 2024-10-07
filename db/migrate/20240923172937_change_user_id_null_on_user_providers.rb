# frozen_string_literal: true

# 一時的にuser_idがnulでも問題ない設定
class ChangeUserIdNullOnUserProviders < ActiveRecord::Migration[7.1]
  def change
    change_column_null :user_providers, :user_id, true
  end
end
