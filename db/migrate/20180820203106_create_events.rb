class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :category
      t.integer :capacity
      t.datetime :time
      t.text :description

      t.timestamps
    end
  end
end
