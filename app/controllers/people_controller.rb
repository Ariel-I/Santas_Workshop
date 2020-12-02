class PeopleController < ApplicationController

    def index
      @people = Person.all
    end 

    def new
      @person = Person.new(person_params) 
    end 

    def create
     # binding.pry  
      @person = Person.create(person_params)
      if @person.save
        redirect_to people_path(@person)
      else
        redirect_to new_person_path
      end 
    end 

    def show
      @person = Person.find_by(id: params[:id])
    end 

    def edit
    end

    def update
    end 

    def destroy
    end 

    private

    def person_params
      params.require[:person].permit(:name, :relationship, :nice_rating, :naughty_rating)
    end 

end
