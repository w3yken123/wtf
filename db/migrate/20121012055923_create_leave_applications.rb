class CreateLeaveApplications < ActiveRecord::Migration
  def change
    create_table :leave_applications do |t|
      t.integer :user_id
      t.integer :leave_list_id

      t.timestamps
    end
	add_index :leave_applications, :user_id
	add_index :leave_applications, :leave_list_id
  end
end
