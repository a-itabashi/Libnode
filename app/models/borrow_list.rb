class BorrowList < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :book_id, uniqueness: true, on: :create, unless: :all_returned?, uniqueness: { message: 'は既に借りられています' }
  validates :user_id, :return_date, presence: true
  validate :return_date_must_be_future_date

  scope :not_return_book, ->(book_id) { where(book_id: book_id).find_by(is_return: false) unless book_id.empty? }

  private

  def all_returned?
    BorrowList.where(book_id: book_id).map(&:is_return).all?
  end

  def return_date_must_be_future_date
    unless return_date.nil?
      errors.add(:error, '過去の日付は表示できません') if format_date(return_date) < format_date(Time.zone.today)
    end
  end

  def format_date(date)
    date.strftime('%Y/%m/%d')
  end
end
