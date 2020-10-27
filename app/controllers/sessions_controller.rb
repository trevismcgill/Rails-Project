class SessionsController < ApplicationController

    def create_by_omniauth
        @user = User.find_or_create_via_omniauth(auth)
        set_session
        redirect_to user_path(@user)
    end

    def create_by_login
        @user = User.find_by(:email => params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            set_session
            redirect_to user_path(@user)
        else
            flash.alert = "Something went wrong!"
            redirect_to login_path
        end
    end

    def destroy
        session.delete("user_id")
        redirect_to login_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end
