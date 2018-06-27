class ForumThreadsController < ApplicationController

    def index
        @threads = ForumThread.all
    end

    def show
        #render plain: params[:slug]
        @thread = ForumThread.find_by_slug(params[:slug])
    end
    
    def new
        @thread = ForumThread.new
    end
end