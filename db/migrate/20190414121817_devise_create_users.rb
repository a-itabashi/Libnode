# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: :uuid do |t|
      t.string :uid, null: false
      t.string :name, null: false
      t.string :email, null: false
      t.string :image, null: false
      t.boolean :admin, null: false, default: false

      t.timestamps null: false
    end
  end
end
