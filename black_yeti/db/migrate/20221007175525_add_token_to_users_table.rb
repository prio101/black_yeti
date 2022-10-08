class AddTokenToUsersTable < ActiveRecord::Migration[7.0]
  def change
    add_column  :users, :token, :string
    add_column  :users, :expire_at, :datetime
  end
end
