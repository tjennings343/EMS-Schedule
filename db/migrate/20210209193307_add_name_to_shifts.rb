class AddNameToShifts < ActiveRecord::Migration[6.1]
  def change
    add_column :shifts, :shift_name, :string
  end
end
