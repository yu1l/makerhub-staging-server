class RemoveUnneededInfoFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :provider, :string
    remove_column :users, :twitter, :string
    remove_column :users, :twitter_access_token, :string
    remove_column :users, :twitter_access_token_secret, :string
    remove_column :users, :twitter_description, :string
    remove_column :users, :twitter_image_url, :string
    remove_column :users, :twitter_location, :string
    remove_column :users, :twitter_name, :string
    remove_column :users, :twitter_nickname, :string
    remove_column :users, :twitter_url, :string
    remove_column :users, :uid, :string
  end
end
