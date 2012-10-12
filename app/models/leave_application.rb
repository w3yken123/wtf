class LeaveApplication < ActiveRecord::Base
  belongs_to :user
  belongs_to :leave_list
  attr_accessible :leave_list_id, :user_id, :leave_date, :leave_num
end
