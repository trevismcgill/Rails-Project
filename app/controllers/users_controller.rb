class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        binding.pry
        @user = User.create(user_params)
        redirect_to user_path(@user)
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :dungeon_master)
    end
end
