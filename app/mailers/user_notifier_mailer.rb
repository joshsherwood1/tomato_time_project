class UserNotifierMailer < ApplicationMailer
  def inform(user, email)
    @user = user
    mail(to: email, subject: "Daily summary for #{user.username}")
  end
end
