class Product < ActiveRecord::Base
  has_many :pay_offs
  has_many :pro_draws
  belongs_to :distributor
  attr_accessible :distributor_id, :p_discount, :p_name, :p_price, :p_stock, :p_type, :p_unit
end
