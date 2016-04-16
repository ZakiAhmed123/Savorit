class FixPosts < ActiveRecord::Migration
  def change
    add_column :posts, :image, :string
    remove_column :posts, :photo_id, :string
  end
end
