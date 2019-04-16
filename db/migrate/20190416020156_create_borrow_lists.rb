class CreateBorrowLists < ActiveRecord::Migration[5.2]
  def change
    create_table :borrow_lists, id: :uuid do |t|
      t.references :book, foreign_key: true, null: false
      t.references :user, foreign_key: true, type: :uuid, null: false
      t.datetime :return_date, null: false
      t.boolean :is_return, null: false, default: false

      t.timestamps
    end
  end
end
