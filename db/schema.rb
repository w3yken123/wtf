# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121012062420) do

  create_table "bills", :force => true do |t|
    t.integer  "custom_id"
    t.integer  "designer"
    t.integer  "assistant"
    t.string   "c_source"
    t.integer  "bill_price"
    t.integer  "assistant_score"
    t.integer  "bill_final_price"
    t.boolean  "appoint"
    t.integer  "expend_event_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "bills", ["custom_id"], :name => "index_bills_on_custom_id"
  add_index "bills", ["expend_event_id"], :name => "index_bills_on_expend_event_id"

  create_table "customs", :force => true do |t|
    t.string   "c_name"
    t.date     "c_birthday"
    t.string   "c_email"
    t.string   "c_tel"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "distributors", :force => true do |t|
    t.string   "corp_name"
    t.string   "corp_type"
    t.string   "corp_tel"
    t.string   "corp_contact"
    t.string   "corp_email"
    t.string   "corp_address"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "expend_events", :force => true do |t|
    t.integer  "service_id"
    t.string   "e_name"
    t.string   "e_type"
    t.string   "e_price"
    t.integer  "e_discount"
    t.integer  "e_dcom"
    t.integer  "e_acom"
    t.string   "e_combine"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "bill_id"
  end

  add_index "expend_events", ["bill_id"], :name => "index_expend_events_on_bill_id"
  add_index "expend_events", ["service_id"], :name => "index_expend_events_on_service_id"

  create_table "leave_applications", :force => true do |t|
    t.integer  "user_id"
    t.integer  "leave_list_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "leave_num"
    t.datetime "leave_date"
  end

  add_index "leave_applications", ["leave_list_id"], :name => "index_leave_applications_on_leave_list_id"
  add_index "leave_applications", ["user_id"], :name => "index_leave_applications_on_user_id"

  create_table "leave_lists", :force => true do |t|
    t.string   "leave_type"
    t.integer  "subtract_money"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "pay_offs", :force => true do |t|
    t.integer  "product_id"
    t.string   "pay_type"
    t.string   "pay_name"
    t.integer  "pay_num"
    t.integer  "pay_unit_price"
    t.integer  "pay_discount"
    t.integer  "pay_subtotal"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "pay_offs", ["product_id"], :name => "index_pay_offs_on_product_id"

  create_table "pro_draws", :force => true do |t|
    t.integer  "product_id"
    t.string   "draw_type"
    t.string   "draw_name"
    t.integer  "user_id"
    t.integer  "draw_num"
    t.text     "notes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pro_draws", ["product_id"], :name => "index_pro_draws_on_product_id"

  create_table "products", :force => true do |t|
    t.string   "p_type"
    t.string   "p_name"
    t.string   "p_unit"
    t.integer  "p_price"
    t.integer  "p_stock"
    t.integer  "distributor_id"
    t.integer  "p_discount"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "products", ["distributor_id"], :name => "index_products_on_distributor_id"

  create_table "services", :force => true do |t|
    t.string   "s_name"
    t.string   "s_type"
    t.integer  "s_price"
    t.integer  "s_discount"
    t.integer  "s_dcom"
    t.integer  "s_acom"
    t.string   "s_combine"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "surname"
    t.string   "name"
    t.boolean  "sex"
    t.string   "address"
    t.string   "work_title"
    t.string   "blood_type"
    t.string   "identification"
    t.datetime "birthday"
    t.string   "telephone"
    t.string   "bank_code"
    t.string   "bank_account"
    t.string   "branch_name"
    t.string   "beneficiary_name"
    t.datetime "first_work"
    t.datetime "last_work"
    t.datetime "add_labor"
    t.datetime "del_labor"
    t.integer  "year_qk"
    t.integer  "day_qk"
    t.integer  "borrow_money"
    t.integer  "salary"
    t.integer  "work_com"
    t.integer  "protect_salary"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
