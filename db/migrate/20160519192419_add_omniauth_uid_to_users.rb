class AddOmniauthUidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :github, :boolean
    add_column :users, :twitter, :boolean
    add_column :users, :twitter_uid, :string
    add_column :users, :github_uid, :string
  end
end
