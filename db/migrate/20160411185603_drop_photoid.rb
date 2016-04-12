class DropPhotoid < ActiveRecord::Migration
  def change
    remove_column :posts, :photo_id, :string
  end
end
