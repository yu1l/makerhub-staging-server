class CreateUserGroups < ActiveRecord::Migration
  def change
    create_table :user_groups do |t|
      t.references :user, index: true, foreign_key: true
      t.references :group, index: true, foreign_key: true
      t.integer :role

      t.timestamps null: false
    end
  end
end
