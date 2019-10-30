class UserNotifierMailer < ApplicationMailer
  def inform(current_user, digest)
    @user = current_user
    @digest = digest
    mail(to: current_user.email, subject: "Daily summary for #{current_user.username}")
  end
end
