class AddSlugToForumThreads < ActiveRecord::Migration[5.2]
  def up
    add_column :forum_threads, :slug, :text, :unique => true
  end

  def down
    remove_column :forum_threads, :slug
  end
end
