class AddClosedAtToFellowstatus < ActiveRecord::Migration
  def change
    add_column :fellowstatuses, :closed_at, :datetime
  end
end
