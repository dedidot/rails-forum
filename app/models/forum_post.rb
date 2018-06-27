class ForumPost < ApplicationRecord
    belongs_to :forum_thread, counter_cache: true
    belongs_to :user
end
