class ChaletPictures < ActiveRecord::Migration
  def change
    create_table :chalet_pictures do |t|
      t.attachment :picture
      t.references :chalet, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
