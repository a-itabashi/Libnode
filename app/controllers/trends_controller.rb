class TrendsController < ApplicationController
  def index
    @top_20_books = Trend.top_20
  end

  def show
    @book = Trend.find(params[:id])
    render json: @book
  end
end
