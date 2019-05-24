class Place < ApplicationRecord
  has_many :book_places, dependent: :destroy
  has_many :books, through: :book_places

  validates :shelf, :column, :row, place: true
end
