class UserNotifierMailer < ApplicationMailer
  def inform(current_user, score)
    @user = current_user
    @score = score
    mail(to: current_user.email, subject: "Daily summary for #{current_user.username}")
  end
end
