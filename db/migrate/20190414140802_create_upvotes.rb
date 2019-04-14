class CreateUpvotes < ActiveRecord::Migration[5.2]
  def change
    create_table :upvotes, id: :uuid do |t|
      t.references :book, foreign_key: true, null: false
      t.references :user, foreign_key: true, type: :uuid, null: false

      t.timestamps
    end
  end
end
