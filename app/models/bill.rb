class Bill < ActiveRecord::Base
  attr_accessible :appoint, :assistant, :assistant_score, :bill_final_price, :bill_price, :c_source, :custom_id, :designer, :expend_event_id, :expend_events_attributes
  has_many :expend_events
  has_many :services, :through => :expend_events
  accepts_nested_attributes_for :expend_events, :allow_destroy => true, :reject_if => :all_blank
end
