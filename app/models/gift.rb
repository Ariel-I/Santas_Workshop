class Gift < ApplicationRecord
    scope :most_expensive_gift, -> {where(cost: self.maximum(:cost))}
    validates :name, :cost, :notes, presence: true
    belongs_to :user
    belongs_to :person 

    accepts_nested_attributes_for :person, reject_if: :all_blank
end 