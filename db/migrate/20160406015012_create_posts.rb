class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :photo_id
      t.integer :user_id
      t.integer :view_count
      t.text :text
      t.string :culture
      t.string :type
      t.timestamps null: false
    end
  end
end
