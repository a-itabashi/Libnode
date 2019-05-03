class UpvotesController < ApplicationController
  def create
    @upvote = current_user.upvotes.build(upvote_params)
    render json: @upvote if @upvote.save
  end

  def destroy
    @upvote = current_user.upvotes.find_by(book_id: params[:id])
    render json: @upvote, serializer: UpvoteSerializer if @upvote.destroy
  end

  private

  def upvote_params
    params.permit(:book_id, :id)
  end
end
