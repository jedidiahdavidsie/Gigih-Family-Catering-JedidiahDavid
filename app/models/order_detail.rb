class OrderDetail < ApplicationRecord
  belongs_to :order, foreign_key: "order_id"
  belongs_to :menu_item, foreign_key: "menu_item_id"
end
