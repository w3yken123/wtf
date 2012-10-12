class CreateLeaveLists < ActiveRecord::Migration
  def change
    create_table :leave_lists do |t|
      t.string :leave_type
      t.integer :subtract_money

      t.timestamps
    end
  end
end
