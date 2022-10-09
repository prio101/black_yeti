class AddAcceptNewsletterToUsersTable < ActiveRecord::Migration[7.0]
  def change
    add_column  :users, :accept_newsletter, :boolean, default: true
  end
end
