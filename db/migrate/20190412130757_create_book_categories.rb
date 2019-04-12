class CreateBookCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :book_categories do |t|
      t.references :book, foreign_key: true, null:false
      t.references :category, foreign_key: true, null:false

      t.timestamps
    end
  end
end
