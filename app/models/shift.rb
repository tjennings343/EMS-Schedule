class Shift < ApplicationRecord
  belongs_to :captain
  belongs_to :truck
  accepts_nested_attributes_for :truck
  
  def self.ordered_by_date
    order(shift_date: :asc) 
  end

end
