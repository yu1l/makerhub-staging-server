class AddGroupIdToRecords < ActiveRecord::Migration
  def change
    add_reference :records, :group, index: true, foreign_key: true
  end
end
