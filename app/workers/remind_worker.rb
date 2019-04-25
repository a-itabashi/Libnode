class RemindWorker
  include Sidekiq::Worker

  def perform
    all_user = User.all.includes(:borrow_lists)
    all_user.each do |user|
      return_dates = user.borrow_lists.where(is_return: false).pluck(:return_date)
      books = Book.find(user.borrow_lists.where(is_return: false).pluck(:book_id)).pluck(:title)
      return_dates.zip(books).each do |date, title|
        RemindMailer.remind(user, date, title).deliver_now if date < Time.zone.today
      end
    end
    RemindWorker.perform_in(1.day)
  end
end
