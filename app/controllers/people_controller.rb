class PeopleController < ApplicationController

    before_action :redirect 

    def index
      @people = current_user.people.all
    end 

    def new
      @person = current_user.people.new
     # @person.gifts.build
    end 

    def create 
      
      @person = current_user.gifts.build.build_person(person_params)
      binding.pry
      if @person.save
        redirect_to people_path(@person)
      else
        redirect_to new_person_path
      end 
    end 

    def show
      @person = Person.find_by(id: params[:id])
    end 

    def destroy
      @person = Person.find_by(id: params[:id])
      @person.destroy
    end 

    private

    def person_params
      params.require(:person).permit(:name, :relationship)
    end 

end
