class Admin::ImportCsvsController < Admin::ApplicationController
  before_action :admin?
  require 'csv'

  def new
    render 'admin/registrations/new_csv'
  end

  def create
    registered_count = import_books
    # TODO: マジックナンバーを無くす
    if registered_count.to_s.length > 10
      redirect_to new_admin_csv_path, notice: registered_count.to_s
    else
      redirect_to new_admin_csv_path, notice: "#{registered_count}件登録しました"
    end
  end

  private

  def import_books
    # 登録処理前のレコード数
    current_book_count = ::Book.count
    books = []
    # windowsで作られたファイルに対応するため、encoding: "SJIS"を付けている
    CSV.foreach(params[:books_file].path, headers: true, encoding: 'UTF-8') do |row|
      books << ::Book.new({ title: row['title'],
                            author: row['author'],
                            saled_at: row['saled_at'],
                            price: row['price'],
                            description: row['description'],
                            image: row['image'] })
    end

    begin
      ::Book.import!(books)
      # 登録したレコード数を返す
      ::Book.count - current_book_count
    rescue StandardError => e
      e
    end
  end
end
