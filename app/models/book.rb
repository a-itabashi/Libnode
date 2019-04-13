class Book < ApplicationRecord
  has_many :book_categories
  has_many :categories, through: :book_categories

  has_many :book_places
  has_many :places, through: :book_places

  validates :title, presence: true
end
