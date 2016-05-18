class AddUuidToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :uuid, :string
  end
end
