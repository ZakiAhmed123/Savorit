class AddDeliveryCost < ActiveRecord::Migration
  def change
    add_column :posts, :delivery_cost, :decimal, default: 7.0
  end
end
