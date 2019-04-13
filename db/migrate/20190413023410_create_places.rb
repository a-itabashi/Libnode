class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.integer :shelf, null: false
      t.integer :column, null: false
      t.integer :row, null: false

      t.timestamps
    end
  end
end
