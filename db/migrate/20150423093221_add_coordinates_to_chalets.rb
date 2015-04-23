class AddCoordinatesToChalets < ActiveRecord::Migration
  def change
    add_column :chalets, :latitude, :float
    add_column :chalets, :longitude, :float
  end
end
