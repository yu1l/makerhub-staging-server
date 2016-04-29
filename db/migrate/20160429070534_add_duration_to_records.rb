class AddDurationToRecords < ActiveRecord::Migration
  def change
    add_column :records, :duration, :float
  end
end
