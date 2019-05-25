class Admin::BooksController < Admin::ApplicationController
  before_action :set_book, only: %i[destroy]

  def edit
    @search = Book.ransack(params[:q])
    @books = @search.result
    render 'books/index'
  end

  def destroy
    if @book.destroy
      flash[:success] = '削除処理が完了しました！'
      head :no_content
    else
      flash[:danger] = '削除処理が失敗しました！'
      head :bad_request
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end
end
