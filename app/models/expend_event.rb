class ExpendEvent < ActiveRecord::Base
  belongs_to :bill
  belongs_to :service
  attr_accessible :e_acom, :e_combine, :e_dcom, :e_discount, :e_name, :e_price, :e_price, :e_type, :service_id
end
