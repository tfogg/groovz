class AddIndexToShows < ActiveRecord::Migration
  def change
  	add_index :shows, :bid_id 
  end
end
