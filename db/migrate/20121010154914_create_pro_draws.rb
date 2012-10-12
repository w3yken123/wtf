class CreateProDraws < ActiveRecord::Migration
  def change
    create_table :pro_draws do |t|
      t.integer :product_id
      t.string :draw_type
      t.string :draw_name
      t.integer :user_id
      t.integer :draw_num
      t.text :notes

      t.timestamps
    end
	add_index :pro_draws, :product_id
  end
end
