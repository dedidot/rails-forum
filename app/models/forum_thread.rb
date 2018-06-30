class ForumThread < ApplicationRecord
    belongs_to :user
    has_many :forum_posts

    has_slug by: :title

    validates :title, presence: true
    validates :content, presence: true

    def sticky?
        sticky_order != 100
    end

    def pinit!
        self.sticky_order = 1
        self.save
    end
end