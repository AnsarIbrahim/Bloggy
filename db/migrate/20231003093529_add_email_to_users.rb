class AddEmailToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :email, :string, null: false, default: ""
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :unconfirmed_email, :string
    add_column :users, :remember_created_at, :datetime
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :datetime
    add_column :users, :encrypted_password, :string, null: false, default: ""
    remove_column :users, :post_counter, :integer
    add_column :users, :post_counter, :integer, null: false, default: 0
  end
end
