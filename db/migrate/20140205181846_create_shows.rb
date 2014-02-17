class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.integer :user_id
      t.text :content
      t.text :maxprice
      t.datetime :start_time, :null => false

      t.timestamps
    end
    add_index :shows, :user_id
  end
end
