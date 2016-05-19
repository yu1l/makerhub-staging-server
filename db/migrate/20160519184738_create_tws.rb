class CreateTws < ActiveRecord::Migration
  def change
    create_table :tws do |t|
      t.references :user, index: true, foreign_key: true
      t.string :uid
      t.string :provider
      t.string :access_token
      t.string :access_token
      t.text :description
      t.string :image
      t.string :location
      t.string :name
      t.string :nickname
      t.string :url

      t.timestamps null: false
    end
  end
end
