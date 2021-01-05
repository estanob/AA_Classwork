class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login(@user)
            redirect_to user_url(@user)
        else 
            render :new
        end
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
