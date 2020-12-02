class Person < ActiveRecord::Base
    belongs_to :user
    has_many :gifts, through: :users
end 