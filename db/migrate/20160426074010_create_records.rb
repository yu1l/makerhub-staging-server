class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :path
      t.string :uuid
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
