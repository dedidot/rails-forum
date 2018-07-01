class ForumThreadPolicy < ApplicationPolicy

    def edit?
        if user
            user.id == record.user_id
        end
    end
    
    def update?
        user.id == record.user_id
    end
    
end