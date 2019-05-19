class Admin::BooksController < Admin::ApplicationController
  before_action :set_book, only: %i[destroy]
  before_action :application_owner?

  def edit
    @books = Book.all
    render 'books/index'
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
  def application_owner?
    unless current_user.name == '三澤直弥'
      flash[:danger] = '現在この機能は限られた管理者のみ実行可能にしています'
      redirect_back(fallback_location: root_path)
    end
  end
end
