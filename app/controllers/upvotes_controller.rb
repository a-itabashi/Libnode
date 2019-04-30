class UpvotesController < ApplicationController
  def create
    @upvote = current_user.upvotes.build(upvote_params)
    render json: @upvote if @upvote.save
  end

  def destroy
    @upvote = Upvote.where(book_id: params[:id].to_i)
    render json: @upvote, serializer: UpvoteSerializer if @upvote.delete_all
  end

  private

  def upvote_params
    params.permit(:book_id, :id)
  end
end
