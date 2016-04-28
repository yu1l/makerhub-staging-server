class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :video_path
      t.string :screenshot_path
      t.string :uuid
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
