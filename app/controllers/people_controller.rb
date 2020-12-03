class PeopleController < ApplicationController

    before_action :redirect 

    def index
      @people = current_user.people.all
    end 

    def new
      @person = current_user.people.new
      @person.gifts.build
    end 

    def create 
      #binding.pry
      @person = current_user.people.build(person_params)
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
      params.require[:person].permit(:name, :relationship,
        gifts_attributes: [
         :name,
         :type,
         :cost,
         :notes
        ]
      )
    end 

end
