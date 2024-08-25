class UpdateUsersForDevise < ActiveRecord::Migration[7.1]
  def change
    # Remove crypted_password column if it exists
    if column_exists?(:users, :crypted_password)
      remove_column :users, :crypted_password
    end

    # Add encrypted_password column if it doesn't exist
    unless column_exists?(:users, :encrypted_password)
      add_column :users, :encrypted_password, :string
    end

    # Add missing columns if they don't already exist
    unless column_exists?(:users, :reset_password_token)
      add_column :users, :reset_password_token, :string
      add_index :users, :reset_password_token, unique: true
    end

    unless column_exists?(:users, :reset_password_sent_at)
      add_column :users, :reset_password_sent_at, :datetime
    end

    unless column_exists?(:users, :remember_created_at)
      add_column :users, :remember_created_at, :datetime
    end

    # Uncomment these if using confirmable and/or lockable
    # unless column_exists?(:users, :confirmation_token)
    #   add_column :users, :confirmation_token, :string
    #   add_index :users, :confirmation_token, unique: true
    # end

    # unless column_exists?(:users, :unlock_token)
    #   add_column :users, :unlock_token, :string
    #   add_index :users, :unlock_token, unique: true
    # end
  end
end
