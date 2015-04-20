class CreateChalets < ActiveRecord::Migration
  def change
    create_table :chalets do |t|
      t.string :title
      t.text :description
      t.string :city
      t.integer :daily_price
      t.integer :max_nb_of_guests
      t.boolean :availability, default: false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
