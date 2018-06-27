class ForumThread < ApplicationRecord
    belongs_to :user
    has_many :forum_posts

    has_slug by: :title

    validates :title, presence: true
    validates :content, presence: true
end