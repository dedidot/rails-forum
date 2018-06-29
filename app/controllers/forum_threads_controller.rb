class ForumThreadsController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create]

    def index
        @threads = ForumThread.order(id: :desc)
    end

    def showbyslug
        #render plain: params[:slug]
        @thread = ForumThread.find_by_slug(params[:slug])
        @post = ForumPost.new
        render "show"
    end

    def show
        @post = ForumPost.new
        @thread = ForumThread.find(params[:slug])
    end
    
    def new
        @thread = ForumThread.new
    end

    def create
        @thread = ForumThread.new(resource_params)
        @thread.user_id = current_user.id
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