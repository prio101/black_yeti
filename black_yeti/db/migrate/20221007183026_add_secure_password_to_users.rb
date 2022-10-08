class AddSecurePasswordToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :password_digest, :string
    add_column :users, :recovery_password_digest, :string
    remove_column :users, :password, :string
  end
end
