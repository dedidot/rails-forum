class ForumPostsController < ApplicationController
    def create
        @thread = ForumThread.find(params[:forum_thread_id])
        @post = ForumPost.new(resource_param)
        @post.user_id = 1
        @post.forum_thread_id = @thread.id

        if @post.save
            redirect_back(fallback_location: detail_forum_path(@thread))
        else 
            redirect_back(fallback_location: detail_forum_path(@thread))
        end
    end

    private

    def resource_param
        params.require(:forum_post).permit(:content)
    end
end