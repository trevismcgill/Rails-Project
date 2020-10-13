class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.id
            redirect_to user_path(@user)
        else
            flash.alert = "Something went wrong!"
            redirect_to new_user_path
        end
    end

    def show
        @user = User.find_by_id(params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :dungeon_master)
    end
end
