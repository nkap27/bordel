class CreateVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.string :category
      t.string :url

      t.timestamps
    end
  end
end
