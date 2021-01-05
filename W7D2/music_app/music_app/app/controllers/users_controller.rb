class UsersController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        @user.save
        if @user
            
        else 
            render :new
        end
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
