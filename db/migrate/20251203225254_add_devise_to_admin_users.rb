# frozen_string_literal: true

class AddDeviseToAdminUsers < ActiveRecord::Migration[7.1]
  def up
    # Only add missing columns so migration does not crash
    change_table :admin_users, bulk: true do |t|
      t.string :email, null: false, default: "" unless column_exists?(:admin_users, :email)
      t.string :encrypted_password, null: false, default: "" unless column_exists?(:admin_users, :encrypted_password)
      t.string :reset_password_token unless column_exists?(:admin_users, :reset_password_token)
      t.datetime :reset_password_sent_at unless column_exists?(:admin_users, :reset_password_sent_at)
      t.datetime :remember_created_at unless column_exists?(:admin_users, :remember_created_at)
    end

    # Add indexes only if missing
    add_index :admin_users, :email unless index_exists?(:admin_users, :email)
    add_index :admin_users, :reset_password_token unless index_exists?(:admin_users, :reset_password_token)
  end

  def down
    # Nothing to rollback safely
    raise ActiveRecord::IrreversibleMigration
  end
end
