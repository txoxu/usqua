class UpdateUsersForDevise < ActiveRecord::Migration[7.1]
  def up
    # カラムが存在すれば削除
    remove_column :users, :salt if column_exists?(:users, :salt)
    remove_column :users, :crypted_password if column_exists?(:users, :crypted_password)
    remove_column :users, :first_name if column_exists?(:users, :first_name)
    remove_column :users, :last_name if column_exists?(:users, :last_name)

    # カラムが存在しなければ追加
    add_column :users, :name, :string, null: false, default: '' unless column_exists?(:users, :name)
    add_column :users, :encrypted_password, :string, default: '' unless column_exists?(:users, :encrypted_password)
    add_column :users, :reset_password_token, :string unless column_exists?(:users, :reset_password_token)
    add_column :users, :reset_password_sent_at, :datetime unless column_exists?(:users, :reset_password_sent_at)
    add_column :users, :remember_created_at, :datetime unless column_exists?(:users, :remember_created_at)

    # インデックスの存在を確認し、必要であれば追加
    add_index :users, :email, unique: true unless index_exists?(:users, :email, unique: true)

    return if index_exists?(:users, :reset_password_token, unique: true)

    add_index :users, :reset_password_token, unique: true
  end

  def down
    # ロールバック時の処理
    remove_column :users, :name if column_exists?(:users, :name)
    remove_column :users, :encrypted_password if column_exists?(:users, :encrypted_password)
    remove_column :users, :reset_password_token if column_exists?(:users, :reset_password_token)
    remove_column :users, :reset_password_sent_at if column_exists?(:users, :reset_password_sent_at)
    remove_column :users, :remember_created_at if column_exists?(:users, :remember_created_at)

    add_column :users, :salt, :string unless column_exists?(:users, :salt)
    add_column :users, :crypted_password, :string unless column_exists?(:users, :crypted_password)
    add_column :users, :first_name, :string unless column_exists?(:users, :first_name)
    add_column :users, :last_name, :string unless column_exists?(:users, :last_name)

    remove_index :users, :email if index_exists?(:users, :email, unique: true)

    return unless index_exists?(:users, :reset_password_token, unique: true)

    remove_index :users, :reset_password_token
  end
end
