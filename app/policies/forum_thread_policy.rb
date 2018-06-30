class ForumThreadPolicy < ApplicationPolicy

    def edit?
        user.id == record.user_id
    end
    
    def update?
        user.id == record.user_id
    end
    
end