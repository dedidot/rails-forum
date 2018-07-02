class AddDeletedAtToForumPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :forum_posts, :deleted_at, :timestamp
    add_index :forum_posts, :deleted_at
  end
end
