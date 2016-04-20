class EditOrderItems < ActiveRecord::Migration
  def change
    remove_column :order_items, :product_id, :integer
    add_column :order_items, :post_id, :integer
  end
end
