class ChangeUnitNumberToString < ActiveRecord::Migration[6.1]
  def change
    change_column :trucks, :unit_number, :string
  end
end
