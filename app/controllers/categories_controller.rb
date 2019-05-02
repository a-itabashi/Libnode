class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    full_categories = Category.all
    @categories = full_categories.map(&:name)
    render json: @categories
  end
end
