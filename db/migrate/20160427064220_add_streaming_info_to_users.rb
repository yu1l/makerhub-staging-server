class AddStreamingInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :streaming_key, :string
    add_column :users, :title, :string, default: 'Anonymous Title'
    add_column :users, :live, :boolean, default: false
    add_column :users, :description, :text, default: 'Anonymous Description'
  end
end
