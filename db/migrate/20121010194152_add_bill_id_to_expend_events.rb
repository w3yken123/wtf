class AddBillIdToExpendEvents < ActiveRecord::Migration
  def change
    add_column :expend_events, :bill_id, :integer
	add_index :expend_events, :bill_id
  end
  
end
