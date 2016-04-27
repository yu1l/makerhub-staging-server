class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :path
      t.string :uuid

      t.timestamps null: false
    end
  end
end
