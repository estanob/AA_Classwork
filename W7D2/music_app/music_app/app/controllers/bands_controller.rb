class BandsController < ApplicationController
    def new
        @band = Band.new
        render :new
    end

    def index 
        @bands = Band.all
        render :index
    end



end
