class Distributor < ActiveRecord::Base
  has_many :products
  attr_accessible :corp_contact, :corp_email, :corp_name, :corp_tel, :corp_type, :corp_address
end
