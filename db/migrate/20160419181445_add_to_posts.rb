class AddToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :name, :string
    add_column :posts, :price, :decimal, default: 0.0
    add_column :posts, :delivery_cost, :decimal, default:0.0
    add_column :posts, :inventory, :integer, default:0
  end
end
