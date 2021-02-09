class ChangeShiftDateToString < ActiveRecord::Migration[6.1]
  def change
    change_column :shifts, :shift_date, :string
  end
end
