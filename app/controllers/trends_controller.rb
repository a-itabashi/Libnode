class TrendsController < ApplicationController
  def index
    @top_20_books = Trend.top_20
  end
end
