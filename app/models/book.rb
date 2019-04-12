class Book < ApplicationRecord
  has_many :book_categories
  has_many :categories, through: :book_categories

  validates :title, presence: true
end
