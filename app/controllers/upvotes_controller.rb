class UpvotesController < ApplicationController
  def create
    @upvote = current_user.upvotes.build(upvote_params)
    # @book = @upvote.book
    render json: @upvote if @upvote.save
  end

  def destroy
    @upvote = Upvote.find(params[:id])
    @book = @upvote.book

    respond_to :js if @upvote.destroy
  end

  private

  def upvote_params
    params.permit(:book_id)
  end
end
