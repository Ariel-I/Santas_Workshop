class Gift < ActiveRecord::Base
    validates :name, presence: true
    belongs_to :user
    belongs_to :person 

    accepts_nested_attributes_for :person 
end 