class Category < ApplicationRecord
  has_many :book_categories, dependent: :destroy
  validetes :name, presence: true
end
