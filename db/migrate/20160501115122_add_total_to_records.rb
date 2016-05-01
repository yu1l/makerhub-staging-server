class AddTotalToRecords < ActiveRecord::Migration
  def change
    add_column :records, :total, :int
  end
end
