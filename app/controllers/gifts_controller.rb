class GiftsController < ApplicationController
    before_action :redirect

    def index
      @gifts = current_user.gifts.all 
    end 

    def new
      @gift = current_user.gifts.new(person_id: params[:person_id])
    end 

    def create
      @gift = current_user.gifts.build(gift_params)
      binding.pry
      if @gift.save
        redirect_to gift_path(@gift)
      else
        redirect_to new_gift_path
      end 
    end 

    def show 
      @gift = current_user.gifts.find_by(id: params[:id])
    end 

    private
    
    def gift_params
      params.require(:gift).permit(:name, :cost, :notes,
        person_attributes: [:name,:relationship])
    end 

end 