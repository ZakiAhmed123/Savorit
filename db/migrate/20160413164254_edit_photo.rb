class EditPhoto < ActiveRecord::Migration
  def change
    remove_column :posts, :photo, :string
    add_column :posts, :image, :string
  end
end
