class AddColumnToLeaveApplications < ActiveRecord::Migration
  def change
    add_column :leave_applications, :leave_num, :integer
    add_column :leave_applications, :leave_date, :datetime
  end
end
