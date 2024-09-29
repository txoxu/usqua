# frozen_string_literal: true
# Users migration from Sorcery to Devise
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
    %i[salt crypted_password first_name last_name].each do |column|
      remove_column :users, column if column_exists?(:users, column)
    end
  end

  def add_new_columns
    new_columns = {
      name: { type: :string, options: { null: false, default: '' } },
      encrypted_password: { type: :string, options: { default: '' } },
      reset_password_token: { type: :string },
      reset_password_sent_at: { type: :datetime },
      remember_created_at: { type: :datetime }
    }

    new_columns.each do |column, attrs|
      add_column :users, column, attrs[:type], attrs[:options] unless column_exists?(:users, column)
    end
  end

  def add_indexes
    add_index :users, :email, unique: true unless index_exists?(:users, :email, unique: true)
    add_index :users, :reset_password_token, unique: true unless index_exists?(:users, :reset_password_token, unique: true)
  end

  def remove_new_columns
    %i[name encrypted_password reset_password_token reset_password_sent_at remember_created_at].each do |column|
      remove_column :users, column if column_exists?(:users, column)
    end
  end

  def add_old_columns
    %i[salt crypted_password first_name last_name].each do |column|
      add_column :users, column, :string unless column_exists?(:users, column)
    end
  end

  def remove_indexes
    remove_index :users, :email if index_exists?(:users, :email, unique: true)
    remove_index :users, :reset_password_token if index_exists?(:users, :reset_password_token, unique: true)
  end
end
