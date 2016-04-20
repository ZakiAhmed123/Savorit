class EditDeliverycost < ActiveRecord::Migration
  def change
    remove_column :posts, :delivery_cost, :decimal
  end
end
