class BorrowList < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :book_id, uniqueness: { scope: :user_id }, on: :create, unless: :all_books_returned?
  # validates :book_id, :user_id, :return_date, presence: true
  validate :return_date_must_be_future_date

  private

  def all_books_returned?
    BorrowList.where(book_id: book_id).map(&:is_return).all?
  end

  def return_date_must_be_future_date
    unless return_date.nil?
      errors.add(:error, '過去の日付は表示できません') if return_date <= Time.zone.today
    end
  end
end
