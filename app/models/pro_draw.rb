class ProDraw < ActiveRecord::Base
  belongs_to :product
  attr_accessible :draw_name, :draw_num, :draw_type, :notes, :product_id, :user_id
end
