class Person < ActiveRecord::Base
    
    has_many :gifts
    has_many :users, through: :gifts

    #accepts_nested_attributes_for :gifts 
end 