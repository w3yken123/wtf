class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.integer :custom_id
      t.integer :designer
      t.integer :assistant
      t.string :c_source
      t.integer :bill_price
      t.integer :assistant_score
      t.integer :bill_final_price
      t.boolean :appoint
      t.integer :expend_event_id

      t.timestamps
    end
	add_index :bills, :custom_id
	add_index :bills, :expend_event_id
  end
end
