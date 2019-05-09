class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author
      t.datetime :saled_at
      t.integer :price, default: 0
      t.text :description
      t.string :image
      t.string :image_raw_url

      t.timestamps
    end
  end
end
