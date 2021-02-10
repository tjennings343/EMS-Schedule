class RemoveBooleanFromTrucks < ActiveRecord::Migration[6.1]
  def change
    remove_column :trucks, :in_service
  end
end
