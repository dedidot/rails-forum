class ForumThreadsController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create]

    def index
        @threads = ForumThread.order(sticky_order: :asc).order(id: :desc)
        if params[:search]
            @threads = @threads.where("title like ?", "%#{params[:search]}%")
        end
        @threads = @threads.paginate(:per_page => 5, :page => params[:page])
    end

    def showbyslug
        #render plain: params[:slug]
        @thread = ForumThread.find_by_slug(params[:slug])
        @post = ForumPost.new
        render "show"
    end

    def show
        @post = ForumPost.new
        @thread = ForumThread.friendly.find(params[:id])
    end

    def destroy
        @thread = ForumThread.friendly.find(params[:id])
        @thread.destroy
        redirect_to root_path, notice: "Berhasil hapus"
    end
    
    def new
        @thread = ForumThread.new
    end

    def pinit
        @thread = ForumThread.friendly.find(params[:id])
        @thread.pinit!
        redirect_to root_path
    end

    def edit
        @thread = ForumThread.friendly.find(params[:id])
        authorize @thread
    end

    def update
        @thread = ForumThread.friendly.find(params[:id])
        authorize @thread
        if @thread.update(resource_params)
            #redirect_back(fallback_location: root_path(@thread))
            redirect_to root_path
        else
            render 'new'
        end
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