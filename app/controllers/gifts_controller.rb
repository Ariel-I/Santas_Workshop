class GiftsController < ApplicationController

    def index
      @gifts = current_user.gifts.all 
    end 

    def new
      @gift = current_user.gifts.new
    end 

    def create
        binding.pry
      @gift = current_user.gifts.build(gift_params)
      if @gift.save
        redirect_to gift_path(@gift)
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