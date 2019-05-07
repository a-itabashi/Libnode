class PurchaseRequestMailer < ApplicationMailer
  default from: 'from@example.com'

  def purchase_request(user, title, reason)
    @user = user
    @title = title
    @reason = reason
    mail(to: @user.email, subject: '【Libnode】書籍の購入リクエストがありました')
  end
end
