class AddTimetoPosts < ActiveRecord::Migration
  def change
    add_column :posts, :purchased_at, :datetime
  end
end
