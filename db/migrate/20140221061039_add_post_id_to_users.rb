class AddPostIdToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :post_id, :integer
  	add_index :users, :post_id

  end


end
