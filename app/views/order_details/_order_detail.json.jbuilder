json.extract! order_detail, :id, :menu_item_id, :order_id, :portion_size, :total_portion_price, :created_at, :updated_at
json.url order_detail_url(order_detail, format: :json)
