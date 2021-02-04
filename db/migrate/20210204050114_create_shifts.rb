class CreateShifts < ActiveRecord::Migration[6.1]
  def change
    create_table :shifts do |t|
      t.datetime :shift_date
      t.belongs_to :captain, null: false, foreign_key: true
      t.belongs_to :truck, null: false, foreign_key: true

      t.timestamps
    end
  end
end
