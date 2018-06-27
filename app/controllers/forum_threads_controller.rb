class ForumThreadsController < ApplicationController

    def index
        @threads = ForumThread.all
    end

    def show
        #render plain: params[:id]
        @thread = ForumThread.find(params[:id])
    end
    
end