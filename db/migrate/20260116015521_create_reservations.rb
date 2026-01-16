class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.date :start_at
      t.date :end_at
      t.integer :people
      t.integer :total_price

      t.timestamps
    end
  end
end
