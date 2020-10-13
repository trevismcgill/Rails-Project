class SessionsController < ApplicationController

    def create
        if @user = User.find_by(email: params[:user][:email])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to new_sessions_path
        end
    end
end
