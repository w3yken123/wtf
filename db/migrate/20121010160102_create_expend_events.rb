class CreateExpendEvents < ActiveRecord::Migration
  def change
    create_table :expend_events do |t|
      t.integer :service_id
      t.string :e_name
      t.string :e_type
      t.string :e_price
      t.integer :e_price
      t.integer :e_discount
      t.integer :e_dcom
      t.integer :e_acom
      t.string :e_combine

      t.timestamps
    end
	add_index :expend_events, :service_id
  end
end
