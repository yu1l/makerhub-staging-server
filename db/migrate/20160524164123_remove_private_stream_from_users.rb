class RemovePrivateStreamFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :private_stream, :string
  end
end
