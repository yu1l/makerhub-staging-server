class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :category
      t.text :description
      t.boolean :live
      t.boolean :private
      t.string :title
      t.integer :total

      t.timestamps null: false
    end
  end
end
