class AddShowIdToStatuses < ActiveRecord::Migration
  def change
  	add_column :statuses, :show_id, :integer
  	add_index :statuses, :show_id
  end
end
