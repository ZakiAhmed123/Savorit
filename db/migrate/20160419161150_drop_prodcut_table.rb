class DropProdcutTable < ActiveRecord::Migration
  def change
    drop_table :prodcuts
  end
end
