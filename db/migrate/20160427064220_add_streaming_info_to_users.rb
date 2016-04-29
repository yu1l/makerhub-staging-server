class AddStreamingInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :streaming_key, :string
    add_column :users, :title, :string
    add_column :users, :live, :boolean, default: false
    add_column :users, :description, :text
  end
end
