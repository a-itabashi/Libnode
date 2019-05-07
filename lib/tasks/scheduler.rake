desc 'This task is called by the Heroku scheduler add-on'
task send_reminder: :environment do
  all_user = User.all.includes(:borrow_lists)
  all_user.each do |user|
    return_dates = user.borrow_lists.where(is_return: false).pluck(:return_date)
    books = Book.find(user.borrow_lists.where(is_return: false).pluck(:book_id)).pluck(:title)
    return_dates.zip(books).each do |date, title|
      RemindMailer.remind(user, date, title).deliver_now if date < Time.zone.today
    end
  end
end

task scraiping_from_Amazon: :environment do
  require 'mechanize'
  require 'active_record'

  ActiveRecord::Base.establish_connection(
    adapter: 'postgresql',
    host: '',
    username: '3isawa',
    password: '',
    database: 'libnode_development'
  )
  class Trend < ApplicationRecord
    def search
      base_url = 'https://www.amazon.co.jp/gp/bestsellers/books/492350/ref=zg_bs_nav_b_2_466298'
      agent = Mechanize.new
      page = agent.get(base_url)
      Trend.transaction do
        1.upto(20) do |n|
          target_id = '#zg_critical'
          # TOP3以降のタグ変更に追従
          if n > 3
            target_id = '#zg_nonCritical'
            n -= 3
          end
          element = page.search("#{target_id} > div:nth-child(#{n}) > div.a-fixed-left-grid.p13n-asin > div")
          title = element.css('div.a-fixed-left-grid-col.a-col-right > a > div').text.strip
          author = get_author(element)
          link = 'https://www.amazon.co.jp/' + \
                 element.css('div.a-fixed-left-grid-col.a-col-right > a').attribute('href').value
          image = element.css('div.a-fixed-left-grid-col.a-col-left > a > img').attribute('src').value
          Trend.create(title: title, author: author, link: link, image: image)
        end
      end
    end

    def get_author(element)
      # 著者ページがある著者とそうでない著者はタグが異なる
      author = element.css('div.a-fixed-left-grid-col.a-col-right > div:nth-child(3) > a').text
      author = element.css('div.a-fixed-left-grid-col.a-col-right > div:nth-child(3) > span').text if author.blank?
      # 著者が存在しない場合、"5つ星"という文字が入る。
      author = '' if author.include?('5つ星')
      return author
    end
  end

  Trend.new.search
end
