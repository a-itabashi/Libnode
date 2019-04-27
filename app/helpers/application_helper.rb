module ApplicationHelper
  def simple_time(time)
    time.strftime('%Y/%m/%d')
  end

  def login_user?
    current_user != nil
  end

  def admin_user?
    current_user.admin == true
  end
end
