module ApplicationHelper
  def simple_time(time)
    time.strftime('%Y/%m/%d')
  end

  def admin_user?
    current_user.admin == true ? true : false
  end
end
