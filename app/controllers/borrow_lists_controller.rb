class BorrowListsController < ApplicationController
  def create
    @borrow_list = BorrowList.new(borrow_list_params)

    @borrow_list.save
  end

  private

  def borrow_list_params
    params.require(:borrow_list).permit(%i[book_id return_date])
  end
end
