module AdminIndexHelper
  def overdue?(user)
    now_borrow_list = BorrowList.return_date_of_borrowing(user)
    !now_borrow_list.select { |date| date < Time.zone.today }.empty?
  end
end
