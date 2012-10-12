class LeaveList < ActiveRecord::Base
  attr_accessible :leave_type, :subtract_money
  has_many :leave_applications
end