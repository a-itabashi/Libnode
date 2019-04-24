class Admin::BooksController < Admin::ApplicationController
  before_action :admin?
  before_action :set_book, only: %i[destroy]

  def edit
    @books = Book.all
    render 'book_collection_list/book_collection_list'
  end

  # def update
  #   binding.pry
  #   @book = Book.find_by(params[:id])
  # end
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

  # def book_params
  #   params.require(:book).permit(:)
  # end
end
