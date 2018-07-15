class UsersController < ApplicationController

    before_action :authenticate_user!, only: [:edit, :update]

    def index
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id]).update(resource_params)
        #@user.avatar.attach(params[:avatar])
        #render plain: @user #@user.avatar.attached?
        flash[:notice] = "Sukses edit"
        redirect_to root_path
    end

    private 

    def resource_params
        params.require(:user).permit(:avatar, :name, :email)
    end
end