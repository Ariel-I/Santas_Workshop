class PeopleController < ApplicationController

    before_action :redirect 

    def index
      @people = current_user.people.uniq
    end 

    def show
      @person = current_user.people.find_by(id: params[:id])
      if @person 
        @gifts = current_user.gifts.where(person_id: params[:id])
      else
        redirect_to people_path
      end 
    end 

end
