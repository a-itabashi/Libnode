class BorrowListsController < ApplicationController
  def create
    @borrow_list = current_user.borrow_lists.build(borrow_list_params)
    if @borrow_list.save
      flash[:success] = '貸出処理が完了しました！'
    else
      flash[:danger] = '貸出処理が失敗しました！'
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @borrow_list = current_user.borrow_lists.find_by(book_id: params[:book_id])
    if @borrow_list != nil && @borrow_list.update(is_return: true)
      flash[:success] = '返却処理が完了しました！'
    else
      flash[:danger] = '返却処理が失敗しました！'
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def borrow_list_params
    params.require(:borrow_list).permit(%i[book_id return_date])
  end
end
