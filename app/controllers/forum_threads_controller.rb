class ForumThreadsController < ApplicationController

    def index
        @threads = ForumThread.order(id: :desc)
    end

    def show
        #render plain: params[:slug]
        @thread = ForumThread.find_by_slug(params[:slug])
    end
    
    def new
        @thread = ForumThread.new
    end

    def create
        @thread = ForumThread.new(resource_params)
        @thread.user_id = 1
        if @thread.save
            redirect_to root_path
        else
            render 'new'
        end
    end

    private

    def resource_params
        params.require(:forum_thread).permit(:title, :content)
    end
end