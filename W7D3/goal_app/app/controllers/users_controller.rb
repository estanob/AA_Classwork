class UsersController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def show
        @user = User.find(params[:id])
        render :show
    end

    def edit
        @user = User.find(params[:id])
        render :edit
    end

    def index
        @users = User.all
        render :index
    end

end
