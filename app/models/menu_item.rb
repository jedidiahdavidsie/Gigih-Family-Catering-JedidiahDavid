class MenuItem < ApplicationRecord
  belongs_to :menu_category, foreign_key: "menu_category_id"
  has_many :order_details, :dependent => :delete_all
end
