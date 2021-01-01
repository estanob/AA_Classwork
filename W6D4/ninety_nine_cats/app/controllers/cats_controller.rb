class CatsController < ApplicationController
  def new
    @cat = Cat.new
    render :new
  end

  def index
    @cats = Cat.all
    # render json: cats

    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def create
    @cat = Cat.new(cat_params)
  
    if @cat.save
    # redirect_to "/users/#{user.id}"
      redirect_to cat_url(@cat)
    # render json: user
    else
      render :new
    # render json: user.errors.full_messages, status: 422
    end

  end

  private
  
  def cat_params
    params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
  end

end
