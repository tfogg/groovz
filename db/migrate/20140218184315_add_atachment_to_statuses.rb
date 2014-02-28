class AddAtachmentToStatuses < ActiveRecord::Migration
  def change
  	add_attachment :statuses, :attachment
  end
end
