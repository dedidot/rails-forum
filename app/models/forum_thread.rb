class ForumThread < ApplicationRecord
    acts_as_paranoid #deleted_at
    extend FriendlyId
    friendly_id :title, use: :slugged

    belongs_to :user
    has_many :forum_posts, dependent: :destroy

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