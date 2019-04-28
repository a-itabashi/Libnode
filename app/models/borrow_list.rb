class BorrowList < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :book_id, uniqueness: { scope: :user_id }, on: :create, unless: :all_books_returned?
  validates :book_id, :user_id, :return_date, presence: true
  validate :return_date_must_be_future_date
  validate :book_id_must_not_blank

  private

  def all_books_returned?
    BorrowList.where(book_id: book_id).map(&:is_return).all?
  end

  def return_date_must_be_future_date
    if return_date.nil?
      errors.add(:error, '返却期限を入力して下さい')
    elsif return_date <= Time.zone.today
      errors.add(:error, '過去の日付は表示できません')
    end
  end

  def book_id_must_not_blank
    errors.add(:error, '書籍番号は必ず入力して下さい') if book_id.nil?
  end
end
