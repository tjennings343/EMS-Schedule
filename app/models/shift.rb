class Shift < ApplicationRecord
  belongs_to :captain
  belongs_to :truck
  accepts_nested_attributes_for :truck
end
