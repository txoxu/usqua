class UpdateUsersForDevise < ActiveRecord::Migration[7.1]
   def change
    # カラムが存在すれば削除
    remove_column :users, :salt if column_exists?(:users, :salt)
    remove_column :users, :crypted_password if column_exists?(:users, :crypted_password)
    remove_column :users, :first_name if column_exists?(:users, :first_name)
    remove_column :users, :last_name if column_exists?(:users, :last_name)
    
    # カラムが存在しなければ追加
    add_column :users, :name, :string, null: false, default: "" unless column_exists?(:users, :name)

    # インデックスの存在を確認し、必要であれば追加
    unless index_exists?(:users, :email, unique: true)
      add_index :users, :email, unique: true
    end
  end
end