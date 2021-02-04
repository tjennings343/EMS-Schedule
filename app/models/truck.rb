class Truck < ApplicationRecord
    has_many :shifts
    has_many :captains, through: :shifts
end
