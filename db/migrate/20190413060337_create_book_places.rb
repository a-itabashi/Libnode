class CreateBookPlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :book_places do |t|
      t.references :book, foreign_key: true, null:false
      t.references :place, foreign_key: true, null:false

      t.timestamps
    end
  end
end
