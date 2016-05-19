class CreateGhs < ActiveRecord::Migration
  def change
    create_table :ghs do |t|
      t.references :user, index: true, foreign_key: true
      t.string :uid
      t.string :provider
      t.string :nickname
      t.string :email
      t.string :image
      t.string :blog_url
      t.string :profile_url

      t.timestamps null: false
    end
  end
end
