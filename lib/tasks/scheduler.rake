desc "This task is called by the Heroku scheduler add-on"
task :send_reminder => :environment do
  all_user = User.all.includes(:borrow_lists)
  all_user.each do |user|
    return_dates = user.borrow_lists.where(is_return: false).pluck(:return_date)
    books = Book.find(user.borrow_lists.where(is_return: false).pluck(:book_id)).pluck(:title)
    return_dates.zip(books).each do |date, title|
      RemindMailer.remind(user, date, title).deliver_now if date < Time.zone.today
    end
  end
end
