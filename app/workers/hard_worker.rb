
class HardWorker
  include Sidekiq::Worker

  def perform()
    all_user = User.all.includes(:borrow_lists)
    all_user.each do |user|
      return_dates = user.borrow_lists.where(is_return: false).pluck(:return_date)
      books = Book.find(user.borrow_lists.where(is_return: false).pluck(:book_id)).pluck(:title)
      return_dates.zip(books).each do |date, title|
        if (date < Time.zone.today)
          Sidekiq::Logging.logger.info("#{user.name}さん #{title}の返却期限は#{date}です！")
        end
      end
    end
  end
end
