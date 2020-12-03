class GiftsController < ApplicationController

    def index
      @gifts = Gift.all 
    end 

    def new
      @gift = Gift.new
    end 

    def create
        binding.pry
      @gift = Gift.new(gift_params)
      if @gift.save
        redirect_to gift_path
      else
        redirect_to new_gift_path
      end 
    end 

    def show 
      @gift = Gift.find_by(id: params[:id])
    end 

    private
    
    def gift_params
      params.require[:gift].permit(:name, :type, :cost, :notes)
    end 

end 