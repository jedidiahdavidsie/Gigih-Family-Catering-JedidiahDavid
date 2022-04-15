class CreateOrderDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :order_details do |t|
      t.integer :menu_item_id
      t.integer :order_id
      t.integer :portion_size
      t.float :total_portion_price

      t.timestamps
    end
  end
end
