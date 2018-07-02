class ForumPost < ApplicationRecord
    acts_as_paranoid #deleted_at
    belongs_to :forum_thread, counter_cache: true
    belongs_to :user

    validates :content, presence: true
end
