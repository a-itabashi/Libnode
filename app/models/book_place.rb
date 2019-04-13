class BookPlace < ApplicationRecord
  belongs_to :book
  belongs_to :place

  validates :book_id, uniqueness: true
end
