class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author
      t.datetime :saled_at
      t.integer :price
      t.text :description
      t.string :image
      t.integer :borrowed_num, default: 0

      t.timestamps
    end
  end
end
