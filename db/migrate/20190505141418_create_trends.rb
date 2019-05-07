class CreateTrends < ActiveRecord::Migration[5.2]
  def change
    create_table :trends, id: :uuid do |t|
      t.string :title, null: false
      t.string :author
      t.string :link, null: false
      t.string :image, null: false

      t.timestamps
    end
  end
end
