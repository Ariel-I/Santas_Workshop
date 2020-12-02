class PeopleController < ApplicationController

    def index
      #binding.pry
      @people = Person.all
    end 

    def new
      @person = Person.new
    end 

    def create
     # binding.pry
      @person = Person.new
      if @person.save
        redirect_to people_path
      else
        redirect_to root_path
      end 
    end 

    def show
      @person = Person.find_by(id: params[:id])
    end 

    private

    def person_params
      params.require(:person).permit(:name, :relationship, :nice_rating, :naughty_rating)
    end 

end
