class TrendsController < ApplicationController
  def index
    @top_20_books = Trend.top_20
  end

  def show
    @book = Trend.find(params[:id])
    render json: @book
  end

  def purchase_request
    admin_users = User.admin_users

    admin_users.each do |user|
      PurchaseRequestMailer.purchase_request(user, params[:title], params[:reason])
    end

    redirect_back(fallback_location: root_path)
    flash[:success] = "#{params[:title]}の購入リクエストが完了しました"
  end
end
