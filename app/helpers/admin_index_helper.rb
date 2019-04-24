module AdminIndexHelper
  def overdue?(user)
    now_borrow_list = user.borrow_lists.where(is_return: false).pluck(:return_date)
    !(now_borrow_list.select{ |date| date < Date.today }.empty?)
  end
end
