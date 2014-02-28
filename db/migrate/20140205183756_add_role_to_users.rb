class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string
    add_index :users, :role
    add_index :users, :location
  end
end
