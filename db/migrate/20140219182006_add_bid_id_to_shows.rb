class AddBidIdToShows < ActiveRecord::Migration
  def change
  	add_column :shows, :bid_id, :integer
  end
end
