class ForumPostsService

    def initialize(params, resource_param, current_user)
        @resource_param = resource_param
        @current_user = current_user
        @forum_thread_id = params[:forum_thread_id]
    end

    def created
        @thread = ForumThread.friendly.find(@forum_thread_id)
        @post = ForumPost.new(@resource_param)
        @post.user_id = @current_user.id
        @post.forum_thread_id = @thread.id
        @post.save
        to_email
        return @thread
    end

    def to_email 
        PostMailer.with(user: @thread.user, post: @post).to_user.deliver_later
    end
    
end