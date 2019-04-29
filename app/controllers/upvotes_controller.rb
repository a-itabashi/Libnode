class UpvotesController < ApplicationController
  def create
    @upvote = current_user.upvotes.build(upvote_params)
    @book = @upvote.book

    respond_to :js if @upvote.save
    redirect_to root_path
  end

  def destroy
    @upvote = Upvote.find(params[:id])
    @book = @upvote.book

    respond_to :js if @upvote.destroy
    redirect_to root_path
  end

  private

  def upvote_params
    params.permit(:book_id)
  end
end
