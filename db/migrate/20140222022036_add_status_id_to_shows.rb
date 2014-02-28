class AddStatusIdToShows < ActiveRecord::Migration
  def change
  	add_column :shows, :status_id, :integer
  	add_index :shows, :status_id
  end
end
