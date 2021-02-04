class CreateTrucks < ActiveRecord::Migration[6.1]
  def change
    create_table :trucks do |t|
      t.integer :unit_number
      t.boolean :in_service

      t.timestamps
    end
  end
end
