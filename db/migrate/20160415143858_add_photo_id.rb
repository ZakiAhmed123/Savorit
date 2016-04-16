class AddPhotoId < ActiveRecord::Migration
  def change
    remove_column :posts, :image, :string
    add_column :posts, :photo_id, :string
end
end
