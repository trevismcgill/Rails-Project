class SessionsController < ApplicationController

    def create
        if auth
            if @user = User.find_by(email: auth[:info][:email])
                set_session
                redirect_to user_path(@user)
            else
                @user = User.new
                @user.email = auth[:info][:email]
                @user.username = auth[:info][:nickname]
                @user.password = SecureRandom.hex
                if @user.save
                    set_session
                    redirect_to user_path(@user)
                else
                    flash.alert = @user.errors.full_messages
                    redirect_to login_path
                end
            end
        else
            @user = User.find_by(email: params[:user][:email])
            if @user && @user.authenticate(params[:user][:password])
                set_session
                redirect_to user_path(@user)
            else
                if @user == nil
                    flash.alert = "There is no account with that email"
                    redirect_to login_path
                else
                    flash.alert = "Your password was incorrect"
                    redirect_to login_path
                end
            end
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
