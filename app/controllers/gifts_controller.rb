class GiftsController < ApplicationController
    before_action :redirect
    before_action :set_gift, only: [:show, :edit, :update, :destroy]

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
        render :new
      end 
    end 

    def show 
      @gift = current_user.gifts.find_by(id: params[:id])
    end 

    def edit
    end

    def update
      if @gift.update(gift_params)
        redirect_to gift_path(@gift) 
      else 
        render :edit 
      end      
    end 

    def destroy
      @gift.destroy
      redirect gifts_path 
    end 

    private

    def set_gift
      @gift = current_user.gifts.find_by(id: params[:id])
      if !@gift
        flash[:error] = "I'm sorry, you don't have access to visit this page."
        redirect_to gifts_path
      end 
    end 
    
    def gift_params
      params.require(:gift).permit(:name, :cost, :notes,
        person_attributes: [:name, :relationship])
    end 

end 