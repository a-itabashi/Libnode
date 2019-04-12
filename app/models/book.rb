class Book < ApplicationRecord
  has_many :book_categories

  validates :title, presence: true
end
