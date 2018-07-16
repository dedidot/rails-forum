class ForumPostsController < ApplicationController

    before_action :authenticate_user!

    def create
        #@thread = ForumThread.friendly.find(params[:forum_thread_id])
        #@post = ForumPost.new(resource_param)
        #@post.user_id = current_user.id
        #@post.forum_thread_id = @thread.id

        todos = ForumPostsService.new(params, resource_param, current_user).created
        if todos
            flash[:notice] = "Berhasil membalas"
            redirect_back(fallback_location: forum_thread_url(todos))
        else 
            flash[:notice] = "Gagal membalas thread"
            #render 'forum_threads/show'
            redirect_back(fallback_location: forum_thread_url(todos))
        end
    end

    private

    def resource_param
        params.require(:forum_post).permit(:content)
    end

end