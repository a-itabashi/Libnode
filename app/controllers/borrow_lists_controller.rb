class BorrowListsController < ApplicationController
  def create
    @borrow_list = current_user.borrow_lists.build(borrow_list_params)
    redirect_back(fallback_location: root_path) if @borrow_list.save
  end

  private

  def borrow_list_params
    params.require(:borrow_list).permit(%i[book_id return_date])
  end
end
