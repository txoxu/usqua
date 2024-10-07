# frozen_string_literal: true

# userをsorcery設定からdevise設定へ移行ファイル
class UpdateUsersForDevise < ActiveRecord::Migration[7.1]
  def up
    remove_old_columns
    add_new_columns
    add_indexes
  end

  def down
    remove_new_columns
    add_old_columns
    remove_indexes
  end

  private

  def remove_old_columns
    # カラムが存在すれば削除
    %i[salt crypted_password first_name last_name].each do |column|
      remove_column :users, column if column_exists?(:users, column)
    end
  end

  def add_new_columns
    # カラムが存在しなければ追加
    add_column :users, :name, :string, null: false, default: '' unless column_exists?(:users, :name)
    add_column :users, :encrypted_password, :string, default: '' unless column_exists?(:users, :encrypted_password)
    add_column :users, :reset_password_token, :string unless column_exists?(:users, :reset_password_token)
    add_column :users, :reset_password_sent_at, :datetime unless column_exists?(:users, :reset_password_sent_at)
    add_column :users, :remember_created_at, :datetime unless column_exists?(:users, :remember_created_at)
  end

  def remove_new_columns
    # ロールバック時の処理
    %i[name encrypted_password reset_password_token reset_password_sent_at remember_created_at].each do |column|
      remove_column :users, column if column_exists?(:users, column)
    end
  end

  def add_old_columns
    # 旧カラムを追加
    %i[salt crypted_password first_name last_name].each do |column|
      add_column :users, column, :string unless column_exists?(:users, column)
    end
  end

  def add_indexes
    # インデックスの存在を確認し、必要であれば追加
    add_index :users, :email, unique: true unless index_exists?(:users, :email, unique: true)

    return if index_exists?(:users, :reset_password_token, unique: true)

    add_index :users, :reset_password_token, unique: true
  end

  def remove_indexes
    # インデックスを削除
    remove_index :users, :email if index_exists?(:users, :email, unique: true)
    remove_index :users, :reset_password_token if index_exists?(:users, :reset_password_token, unique: true)
  end
end
