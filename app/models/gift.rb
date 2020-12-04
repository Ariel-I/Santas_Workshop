class Gift < ActiveRecord::Base
    validates :name, :cost, :notes, presence: true
    belongs_to :user
    belongs_to :person 

    accepts_nested_attributes_for :person, reject_if: :all_blank
end 