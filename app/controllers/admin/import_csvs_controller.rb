class Admin::ImportCsvsController < Admin::ApplicationController
  require 'csv'

  def create
    registered_count = import_books
    # redirect_to new_csv_path, notice: "#{registered_count}件登録しました"
  end

  private

  def import_books
    # 登録処理前のレコード数
    current_book_count = ::Book.count
    books = []
    # windowsで作られたファイルに対応するので、encoding: "SJIS"を付けている
    CSV.foreach(params[:books_file].path, headers: true, encoding: 'UTF-8') do |row|
      books << ::Book.new({ title: row['title'],
                            author: row['author'],
                            saled_at: row['saled_at'],
                            price: row['price'],
                            description: row['description'],
                            image: row['image'] })
    end
    # importメソッドでバルクインサートできる
    ::Book.import(books)
    # 何レコード登録できたかを返す
    ::Book.count - current_book_count
  end
end
