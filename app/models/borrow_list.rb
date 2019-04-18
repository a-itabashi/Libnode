class BorrowList < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :book_id, uniqueness: { scope: :user_id }, on: :create, unless: :all_books_returned?
  validates :book_id, :user_id, :return_date, presence: true

  def all_books_returned?
    BorrowList.where(book_id: book_id).map(&:is_return).all?
  end
end
