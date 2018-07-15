class ForumThreadPolicy < ApplicationPolicy

    def edit?
        if user
            user.id == record.user_id || user.admin?
        end
    end
    
    def update?
        user.id == record.user_id || user.admin?
    end

    def pinit?
        if user
            user.admin?
        end
    end
    
end