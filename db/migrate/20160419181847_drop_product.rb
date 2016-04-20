class DropProduct < ActiveRecord::Migration
  def change
    drop_table :products
  end
end
