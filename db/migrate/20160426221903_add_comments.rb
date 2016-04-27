class AddComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      t.integer :post_id
      t.integer :comment_view_count, defaul: 0
      t.timestamps null: false
    end
  end
end
