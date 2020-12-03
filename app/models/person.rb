class Person < ActiveRecord::Base
    belongs_to :user
    has_many :gifts, through: :user
    accept_nested_attributes_for :gifts 
end 