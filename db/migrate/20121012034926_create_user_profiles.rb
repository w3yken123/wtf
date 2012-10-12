class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.integer :user_id
      t.string :surname
      t.string :name
      t.boolean :sex
      t.string :address
      t.string :work_title
      t.string :blood_type
      t.string :identification
      t.datetime :birthday
      t.string :telephone
      t.string :bank_code
      t.string :bank_account
      t.string :branch_name
      t.string :beneficiary_name
      t.datetime :first_work
      t.datetime :last_work
      t.datetime :add_labor
      t.datetime :del_labor
      t.integer :year_qk
      t.integer :day_qk
      t.integer :borrow_money
      t.integer :salary
      t.integer :work_com
      t.integer :protect_salary

      t.timestamps
    end
  end
end
