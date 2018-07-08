class PostMailer < ApplicationMailer

    def to_user
        @user = params[:user]
        @post = params[:post]
        mail(to: @user.email, subject: 'Reply your thread')
    end
end
