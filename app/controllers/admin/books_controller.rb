class Admin::BooksController < Admin::ApplicationController
  # before_action :set_book, only: [:update, :destroy]

  def edit
    @books = Book.all
    render 'book_collection_list/book_collection_list'
  end

  # def update;end
  # def destroy;end

  # private

  # def set_book
  #   @book = Book.find(params[:id])
  # end

  # def book_params
  #   params.require(:book).permit(:)
  # end
end
