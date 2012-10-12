class UserProfile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :add_labor, :address, :bank_account, :bank_code, :beneficiary_name, :birthday, :blood_type, :borrow_money, :branch_name, :day_qk, :del_labor, :first_work, :identification, :last_work, :name, :protect_salary, :salary, :sex, :surname, :telephone, :user_id, :work_com, :work_title, :year_qk
end
