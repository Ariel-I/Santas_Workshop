class PeopleController < ApplicationController

    def index
     # binding.pry
      @people = Person.all
    end 

    def new
      @person = Person.new(person_params) 
    end 

    def create
     # binding.pry  
      @person = Person.create(person_params)
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
      params.permit(:name, :relationship, :nice_rating, :naughty_rating)
    end 

end
