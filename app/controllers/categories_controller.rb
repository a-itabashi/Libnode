class CategoriesController < ApplicationController
  def index
    full_categories = Category.all
    @categories = full_categories.map(&:name)
    render json: @categories
  end
end
