class Service < ActiveRecord::Base
  has_many :expend_events
  has_many :bills, :through => :expend_events
  attr_accessible :s_acom, :s_combine, :s_dcom, :s_discount, :s_name, :s_price, :s_type
end
