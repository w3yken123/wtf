class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :p_type
      t.string :p_name
      t.string :p_unit
      t.integer :p_price
      t.integer :p_stock
      t.integer :distributor_id
      t.integer :p_discount

      t.timestamps
    end
	add_index :products, :distributor_id
  end
end
