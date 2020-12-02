class PeopleController < ApplicationController

    def index
      @people = Person.all
    end 

    def new
      @person = Person.new
    end 

    def create
      @person = Person.new
      if @person.save
        redirect_to people_path
      else
        redirect_to root_path
      end 
    end 

    def show
      @person = person.find_by(id: params[:id])
    end 

    private

    def person_params
      params.require(:nice_list).permit(:name, :relationship, :nice_rating, :naughty_rating)
    end 

end
