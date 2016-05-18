class AddPrivateToRecords < ActiveRecord::Migration
  def change
    add_column :records, :private, :boolean
  end
end
