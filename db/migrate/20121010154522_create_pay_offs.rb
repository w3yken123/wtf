class CreatePayOffs < ActiveRecord::Migration
  def change
    create_table :pay_offs do |t|
	  t.integer :product_id
      t.string :pay_type
      t.string :pay_name
      t.integer :pay_num
      t.integer :pay_unit_price
      t.integer :pay_discount
      t.integer :pay_subtotal
	  
      t.timestamps
    end
	add_index :pay_offs, :product_id
  end
end
