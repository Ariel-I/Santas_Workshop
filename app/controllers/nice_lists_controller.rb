class NiceListsController < ApplicationController

    def index
      @nice_lists = NiceList.all
    end 

    def new
      @nice_list = NiceList.new
    end 

    def create
      @nice_list = NiceList.new
      if @nice_list.save
        redirect_to nice_lists_path
      else
        redirect_to root_path
      end 
    end 

    def show
      @nice_list = NiceList.find_by(id: params[:id])
    end 

    private

    def nice_list_params
      params.require(:nice_list).permit(:name, :relationship, :nice_rating)
    end 

end
