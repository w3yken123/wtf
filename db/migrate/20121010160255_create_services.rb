class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :s_name
      t.string :s_type
      t.integer :s_price
      t.integer :s_discount
      t.integer :s_dcom
      t.integer :s_acom
      t.string :s_combine

      t.timestamps
    end
  end
end
