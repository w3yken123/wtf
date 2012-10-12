class Custom < ActiveRecord::Base
  belongs_to :bill
  attr_accessible :c_birthday, :c_email, :c_name, :c_tel
end
