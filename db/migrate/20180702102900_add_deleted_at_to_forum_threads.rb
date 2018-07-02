class AddDeletedAtToForumThreads < ActiveRecord::Migration[5.2]
  def up
    add_column :forum_threads, :deleted_at, :timestamp
    add_index :forum_threads, :deleted_at
  end
  def down
  end
end
