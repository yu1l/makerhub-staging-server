# Twitter
class AddTwitterInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nickname,    :string
    add_column :users, :image_url,   :string
    add_column :users, :name,        :string
    add_column :users, :twitter_url, :string
    add_column :users, :description, :string
    add_column :users, :location,    :string
  end
end
