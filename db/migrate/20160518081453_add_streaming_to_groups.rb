class AddStreamingToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :streaming, :boolean
  end
end
