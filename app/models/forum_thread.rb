class ForumThread < ApplicationRecord
    belongs_to :user
    has_many :forum_posts

    has_slug by: :title
end