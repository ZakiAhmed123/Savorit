class FixoImage < ActiveRecord::Migration
  def change
    remove_column :posts, :photo_id, :string
    add_column :posts, :image, :string
  end
end
