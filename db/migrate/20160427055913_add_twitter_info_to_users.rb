# Twitter
class AddTwitterInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :twitter_nickname,    :string
    add_column :users, :twitter_image_url,   :string
    add_column :users, :twitter_name,        :string
    add_column :users, :twitter_url, :string
    add_column :users, :twitter_description, :string
    add_column :users, :twitter_location,    :string
  end
end
