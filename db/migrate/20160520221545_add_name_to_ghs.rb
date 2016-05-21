class AddNameToGhs < ActiveRecord::Migration
  def change
    add_column :ghs, :name, :string
  end
end
