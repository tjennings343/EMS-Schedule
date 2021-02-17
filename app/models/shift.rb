class Shift < ApplicationRecord
  belongs_to :captain
  belongs_to :truck
  validates :shift_name, presence: true
  validates :shift_date, presence: true
  accepts_nested_attributes_for :truck
  
  def self.ordered_by_date
    order(shift_date: :asc) 
  end

end
