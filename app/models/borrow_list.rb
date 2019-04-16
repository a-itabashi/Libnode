class BorrowList < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :book_id, uniqueness: { scope: :user_id }
  validates :book_id, :user_id, :return_date, presence: true
end
