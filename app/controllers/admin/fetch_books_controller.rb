class Admin::FetchBooksController < Admin::ApplicationController
  def search
    isbn = params[:isbn]
    @book = RakutenWebService::Books::Book.search(isbn: params[:isbn]).first if isbn.present?
    render json: @book, serializer: BookMetaSerializer
  end
end
