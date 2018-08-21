class RemoveCategoryFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :category
  end
end
