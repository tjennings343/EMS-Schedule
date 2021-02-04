class TrucksController < ApplicationController
    has_many :shifts
    has_many :captains, through: :shifts
end
