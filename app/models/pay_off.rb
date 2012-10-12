class PayOff < ActiveRecord::Base
  belongs_to :product
  attr_accessible :pay_discount, :pay_name, :pay_num, :pay_subtotal, :pay_type, :pay_unit_price, :product_id
end
