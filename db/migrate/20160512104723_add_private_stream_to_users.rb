class AddPrivateStreamToUsers < ActiveRecord::Migration
  def change
    add_column :users, :private_stream, :boolean
  end
end
