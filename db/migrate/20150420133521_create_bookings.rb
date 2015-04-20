class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :total_price
      t.date :arrive_on
      t.date :leave_on
      t.references :user, index: true, foreign_key: true
      t.references :chalet, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
