class PurchaseRequestMailer < ApplicationMailer
  default from: 'from@example.com'

  def purchase_request(user, title, reason)
    @user_name = user.name
    @user_email = user.email
    @title = title
    @reason = reason

    mail(to: @user_email, subject: '【Libnode】書籍の購入リクエストがありました')
  end
end
