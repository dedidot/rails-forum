class ForumPostsController < ApplicationController

    before_action :authenticate_user!

    def create
        @thread = ForumThread.friendly.find(params[:forum_thread_id])
        @post = ForumPost.new(resource_param)
        @post.user_id = current_user.id
        @post.forum_thread_id = @thread.id

        if @post.save
            PostMailer.with(user: @thread.user, post: @post).to_user.deliver_later
            redirect_back(fallback_location: detail_forum_path(@thread))
        else 
            #render 'forum_threads/show'
            redirect_back(fallback_location: detail_forum_path(@thread))
        end
    end

    private

    def resource_param
        params.require(:forum_post).permit(:content)
    end
end