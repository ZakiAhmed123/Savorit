class EditText < ActiveRecord::Migration
  def change
    remove_column :posts, :text, :text
    add_column :posts, :description, :text
  end
end
