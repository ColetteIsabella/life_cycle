class AddUserIdToFellowstatuses < ActiveRecord::Migration
  def change
    add_column :fellowstatuses, :user_id, :integer
    add_index :fellowstatuses, :user_id
  end
end
