# frozen_string_literal: true

class ChangeUserIdNullOnUserProviders < ActiveRecord::Migration[7.1]
  def change
    change_column_null :user_providers, :user_id, true
  end
end
