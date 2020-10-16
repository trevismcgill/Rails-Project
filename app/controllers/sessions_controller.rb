class SessionsController < ApplicationController

    def create
        if auth
            if @user = User.find_by(email: auth[:info][:email])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                @user = User.new
                @user.email = auth[:info][:email]
                @user.username = auth[:info][:nickname]
                @user.password = SecureRandom.hex
                if @user.save
                    session[:user_id] = @user.id
                    redirect_to user_path(@user)
                else
                    redirect_to login_path
                end
            end
        else
            @user = User.find_by(email: params[:user][:email])
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                redirect_to login_path
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
