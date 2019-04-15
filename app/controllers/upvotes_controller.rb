class UpvotesController < ApplicationController
  def create
    @upvote = current_user.upvotes.build(upvote_params)
    @book = @upvote.book

    @upvote.save
    render json: @upvote
  end

  def destroy
    @upvote = Upvote.find(params[:id])
    @book = @upvote.book

    @like.destroy
    render json: @upvote
  end

  private

  def upvote_params
    params.permit(:book_id)
  end
end
