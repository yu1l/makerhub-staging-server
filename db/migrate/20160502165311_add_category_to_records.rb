class AddCategoryToRecords < ActiveRecord::Migration
  def change
    add_column :records, :category, :integer
  end
end
