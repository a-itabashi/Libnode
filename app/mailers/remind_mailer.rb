class RemindMailer < ApplicationMailer
  add_template_helper(ApplicationHelper)

  default from: 'from@example.com'
  def remind(user, date, title)
    @user_name = user.name
    @user_email = user.email
    @date = date
    @title = title
    mail(to: @user_email, subject: "【Libnode】#{@title}の返却期限が過ぎています")
  end
end
